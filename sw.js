/* ================================================================
   SoilIQ Service Worker — Self-Destruct & Cache Purge
   Removes all local caches and unregisters to ensure 100% online mode
================================================================ */

self.addEventListener('install', e => {
  self.skipWaiting();
});

self.addEventListener('activate', e => {
  e.waitUntil(
    caches.keys()
      .then(keys => Promise.all(keys.map(k => caches.delete(k))))
      .then(() => self.registration.unregister())
      .then(() => self.clients.claim())
  );
});

// Do not intercept any fetch events — all network requests pass through directly
