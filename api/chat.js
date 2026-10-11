// Proxy for Google Gemini API — supports multimodal vision (image + text)
// Body size limit increased for base64 image payloads
export const config = {
  api: {
    bodyParser: {
      sizeLimit: '10mb',
    },
    responseLimit: false,
  },
  maxDuration: 60,
};

// Gemini models to try in order. If the first times out / 503s, we fall to the next.
// Using 'gemini-flash-latest' = Google's stable alias, always points to their current
// recommended model automatically — no more manual updates when Google renames models.
const MODEL_FALLBACK_CHAIN = [
  'gemini-flash-latest',  // ← auto-updates with Google, never goes stale
  'gemini-1.5-flash',     // ← proven fallback, very stable
];

// Per-attempt timeout (ms). Must be well under Vercel's 60 s maxDuration so we
// have time to try the fallback model before Vercel kills the function.
const GEMINI_TIMEOUT_MS = 25000;

async function callGemini(apiKey, modelId, geminiBody) {
  const controller = new AbortController();
  const timer = setTimeout(() => controller.abort(), GEMINI_TIMEOUT_MS);

  try {
    const res = await fetch(
      `https://generativelanguage.googleapis.com/v1beta/models/${modelId}:generateContent?key=${apiKey}`,
      {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(geminiBody),
        signal: controller.signal,
      }
    );
    clearTimeout(timer);
    return res;
  } catch (err) {
    clearTimeout(timer);
    throw err; // re-throw (includes AbortError on timeout)
  }
}

export default async function handler(req, res) {
  // ── CORS ──────────────────────────────────────────────────────────────────
  const origin = req.headers.origin || '*';
  res.setHeader('Access-Control-Allow-Origin', origin);
  res.setHeader('Access-Control-Allow-Methods', 'GET,OPTIONS,PATCH,DELETE,POST,PUT');
  res.setHeader(
    'Access-Control-Allow-Headers',
    'X-CSRF-Token, X-Requested-With, Accept, Accept-Version, Content-Length, Content-MD5, Content-Type, Date, X-Api-Version, Authorization'
  );

  if (req.method === 'OPTIONS') { res.status(200).end(); return; }
  if (req.method !== 'POST') return res.status(405).json({ error: 'Method not allowed' });

  // ── API key ───────────────────────────────────────────────────────────────
  const apiKey = process.env.GEMINI_API_KEY;
  if (!apiKey) {
    return res.status(500).json({ error: 'GEMINI_API_KEY is not set in Vercel environment variables.' });
  }

  try {
    // ── Parse request ───────────────────────────────────────────────────────
    const { messages = [], temperature = 0.5, max_tokens = 800 } = req.body;

    // ── Build Gemini payload ────────────────────────────────────────────────
    const systemMsg = messages.find(m => m.role === 'system');
    const systemInstruction = systemMsg
      ? { parts: [{ text: systemMsg.content }] }
      : undefined;

    const contents = messages
      .filter(m => m.role !== 'system')
      .map(m => {
        const role = m.role === 'assistant' ? 'model' : 'user';

        if (Array.isArray(m.content)) {
          const parts = m.content.map(part => {
            if (part.type === 'text') return { text: part.text };
            if (part.type === 'image_url') {
              const url = part.image_url?.url || '';
              const match = url.match(/^data:([^;]+);base64,(.+)$/);
              if (match) return { inlineData: { mimeType: match[1], data: match[2] } };
              return { fileData: { mimeType: 'image/jpeg', fileUri: url } };
            }
            return { text: '' };
          });
          return { role, parts };
        }

        return { role, parts: [{ text: m.content || '' }] };
      });

    const geminiBody = {
      contents,
      generationConfig: { temperature, maxOutputTokens: max_tokens },
    };
    if (systemInstruction) geminiBody.systemInstruction = systemInstruction;

    // ── Try each model in the fallback chain ────────────────────────────────
    let lastError = null;

    for (const modelId of MODEL_FALLBACK_CHAIN) {
      try {
        const geminiRes = await callGemini(apiKey, modelId, geminiBody);

        // Gemini returned a non-2xx (e.g. 503 overloaded) — try next model
        if (!geminiRes.ok) {
          const errData = await geminiRes.json().catch(() => ({}));
          const msg = errData?.error?.message || `Gemini ${geminiRes.status}`;
          console.warn(`[chat] model=${modelId} status=${geminiRes.status}: ${msg}`);
          lastError = { status: geminiRes.status, message: msg };
          // Only retry on transient errors (429, 500, 503)
          if (![429, 500, 503].includes(geminiRes.status)) {
            return res.status(geminiRes.status).json({ error: msg, details: errData });
          }
          continue; // try next model
        }

        const data = await geminiRes.json();
        const text = data?.candidates?.[0]?.content?.parts?.[0]?.text || '';

        // ── Success: return OpenAI-style response ───────────────────────────
        return res.status(200).json({
          choices: [{ message: { role: 'assistant', content: text }, finish_reason: data?.candidates?.[0]?.finishReason || 'stop' }],
          model: modelId,
          usage: data?.usageMetadata || {},
        });

      } catch (err) {
        const isTimeout = err.name === 'AbortError';
        console.warn(`[chat] model=${modelId} ${isTimeout ? 'TIMED OUT' : 'FETCH ERROR'}: ${err.message}`);
        lastError = { status: isTimeout ? 504 : 500, message: isTimeout ? `Gemini timed out (>${GEMINI_TIMEOUT_MS / 1000}s)` : err.message };
        // Always try next model on timeout / network error
        continue;
      }
    }

    // ── All models failed ───────────────────────────────────────────────────
    const statusCode = lastError?.status || 503;
    console.error(`[chat] All Gemini models failed. Last error: ${JSON.stringify(lastError)}`);
    return res.status(statusCode).json({
      error: lastError?.message || 'Gemini is temporarily unavailable. Please try again.',
      retryable: true,
    });

  } catch (err) {
    console.error('[chat] Unexpected error:', err);
    return res.status(500).json({ error: err.message });
  }
}
