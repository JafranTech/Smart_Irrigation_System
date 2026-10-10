// Proxy for Google Gemini API — supports multimodal vision (image + text)
// Body size limit increased for base64 image payloads
export const config = {
  api: {
    bodyParser: {
      sizeLimit: '10mb',
    },
    responseLimit: false,
  },
  maxDuration: 30,
};

export default async function handler(req, res) {
  // CORS Headers
  res.setHeader('Access-Control-Allow-Credentials', 'true');
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET,OPTIONS,PATCH,DELETE,POST,PUT');
  res.setHeader(
    'Access-Control-Allow-Headers',
    'X-CSRF-Token, X-Requested-With, Accept, Accept-Version, Content-Length, Content-MD5, Content-Type, Date, X-Api-Version, Authorization'
  );

  if (req.method === 'OPTIONS') {
    res.status(200).end();
    return;
  }

  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  try {
    // API key is a server-side secret stored in Vercel environment variables.
    // It is NEVER sent from or exposed to the browser.
    const apiKey = process.env.GEMINI_API_KEY;

    if (!apiKey) {
      return res.status(500).json({ error: 'Gemini API key is not configured on the server. Set GEMINI_API_KEY in Vercel environment variables.' });
    }

    // Convert OpenAI-style messages to Gemini generateContent format
    const { model = 'gemini-2.0-flash', messages = [], temperature = 0.5, max_tokens = 800 } = req.body;

    // Extract system prompt (Gemini uses systemInstruction separately)
    const systemMsg = messages.find(m => m.role === 'system');
    const systemInstruction = systemMsg
      ? { parts: [{ text: systemMsg.content }] }
      : undefined;

    // Build Gemini contents from non-system messages
    const contents = messages
      .filter(m => m.role !== 'system')
      .map(m => {
        // Map OpenAI roles: 'assistant' -> 'model'
        const role = m.role === 'assistant' ? 'model' : 'user';

        // Handle multimodal content (array with text + image_url)
        if (Array.isArray(m.content)) {
          const parts = m.content.map(part => {
            if (part.type === 'text') {
              return { text: part.text };
            } else if (part.type === 'image_url') {
              const url = part.image_url?.url || '';
              // base64 data URI: data:image/jpeg;base64,<data>
              const match = url.match(/^data:([^;]+);base64,(.+)$/);
              if (match) {
                return { inlineData: { mimeType: match[1], data: match[2] } };
              }
              // Plain public URL
              return { fileData: { mimeType: 'image/jpeg', fileUri: url } };
            }
            return { text: '' };
          });
          return { role, parts };
        }

        // Plain text content
        return { role, parts: [{ text: m.content || '' }] };
      });

    // Build Gemini request body
    const geminiBody = {
      contents,
      generationConfig: { temperature, maxOutputTokens: max_tokens },
    };
    if (systemInstruction) geminiBody.systemInstruction = systemInstruction;

    const geminiRes = await fetch(
      `https://generativelanguage.googleapis.com/v1beta/models/${model}:generateContent?key=${apiKey}`,
      {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(geminiBody),
      }
    );

    const data = await geminiRes.json();

    if (!geminiRes.ok) {
      return res.status(geminiRes.status).json({ error: data?.error?.message || 'Gemini API error', details: data });
    }

    // Translate Gemini response back to OpenAI-style for the frontend
    const text = data?.candidates?.[0]?.content?.parts?.[0]?.text || '';
    return res.status(200).json({
      choices: [{ message: { role: 'assistant', content: text }, finish_reason: data?.candidates?.[0]?.finishReason || 'stop' }],
      model,
      usage: data?.usageMetadata || {},
    });
  } catch (err) {
    return res.status(500).json({ error: err.message });
  }
}
