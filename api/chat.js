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

// Gemini models to try in order. If one fails (404, 429 quota, 503 busy, timeout), we fall to the next.
// gemini-3.5-flash & gemini-3.5-flash-lite are verified active with multimodal vision.
const MODEL_FALLBACK_CHAIN = [
  'gemini-3.5-flash',       // Primary: Fast, multimodal vision, active
  'gemini-3.5-flash-lite',  // High-availability fallback: separate quota pool
  'gemini-3.8-flash',       // Advanced next-gen model
  'gemini-flash-latest',    // Dynamic latest alias
];

// Per-attempt timeout (ms). Keep at 15s so we can try fallbacks before Vercel 60s limit
const GEMINI_TIMEOUT_MS = 15000;

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
          // If auth failed (401/403 invalid key), fail fast
          if ([401, 403].includes(geminiRes.status)) {
            return res.status(geminiRes.status).json({ error: msg, details: errData });
          }
          // For 404 (model retired/alias changed), 429 (rate/quota limit), 500, 502, 503 (busy) — try next model
          continue;
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
