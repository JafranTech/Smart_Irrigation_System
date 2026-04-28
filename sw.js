/* ================================================================
   SoilIQ Service Worker
   Strategy: Cache-first for app shell, network-first for API calls
================================================================ */

const CACHE_NAME  = 'soiliq-v1';
const SHELL_URLS  = [
  '/',
  '/soiliq_ui.html',
  '/manifest.json',
  '/icons/icon.svg',
  'https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;900&display=swap',
  'https://fonts.googleapis.com/css2?family=Space+Mono:wght@400;700&display=swap',
  'https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap'
];

/* ── Install: pre-cache app shell ── */
self.addEventListener('install', e => {
  e.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => cache.addAll(SHELL_URLS))
      .then(() => self.skipWaiting())
  );
});

/* ── Activate: delete old caches ── */
self.addEventListener('activate', e => {
  e.waitUntil(
    caches.keys().then(keys =>
      Promise.all(keys.filter(k => k !== CACHE_NAME).map(k => caches.delete(k)))
    ).then(() => self.clients.claim())
  );
});

/* ── Fetch: network-first for Supabase/API, cache-first for shell ── */
self.addEventListener('fetch', e => {
  const url = new URL(e.request.url);

  // Always go network-first for Supabase, Open-Meteo, external APIs
  const isAPI = url.hostname.includes('supabase.co')
             || url.hostname.includes('open-meteo.com')
             || url.hostname.includes('bigdatacloud.net');

  if (isAPI) {
    // Network only — never cache live sensor/weather data
    e.respondWith(fetch(e.request).catch(() => new Response('{"error":"offline"}', {
      headers: { 'Content-Type': 'application/json' }
    })));
    return;
  }

  // Cache-first for app shell (HTML, fonts, icons)
  e.respondWith(
    caches.match(e.request).then(cached => {
      if (cached) return cached;
      return fetch(e.request).then(response => {
        // Cache successful GET responses
        if (e.request.method === 'GET' && response.status === 200) {
          const clone = response.clone();
          caches.open(CACHE_NAME).then(cache => cache.put(e.request, clone));
        }
        return response;
      }).catch(() => caches.match('/soiliq_ui.html'));
    })
  );
});
