const CACHE_VERSION = 'v1'
const CACHE_NAME = CACHE_VERSION + ':animal-tracker-sw'

function getItemsToCache (): string[] {
  const cacheEls: HTMLMetaElement[] = Array.from(document.querySelectorAll('[name="cache"]'))

  return cacheEls.map((element) => (
    element.getAttribute('content')
  ))
}

function onInstall (event): void {
  console.log('[Serviceworker]', 'Installing!', event)
  event.waitUntil(
    caches.open(CACHE_NAME).then(async function prefill (cache) {
      return await cache.addAll(getItemsToCache())
    })
  )
}

function onActivate (event): void {
  console.log('[Serviceworker]', 'Activating!', event)
  event.waitUntil(
    caches.keys().then(async function (cacheNames) {
      return await Promise.all(
        cacheNames.filter(function (cacheName) {
          // Return true if you want to remove this cache,
          // but remember that caches are shared across
          // the whole origin
          return cacheName.indexOf(CACHE_VERSION) !== 0
        }).map(async function (cacheName) {
          return await caches.delete(cacheName)
        })
      )
    })
  )
}

// Borrowed from https://github.com/TalAter/UpUp
function onFetch (event): void {
  // Paul Irish fix:
  // DevTools opening will trigger these o-i-c requests, which this SW can't handle.
  // There's probaly more going on here, but I'd rather just ignore this problem. :)
  // https://github.com/paulirish/caltrainschedule.io/issues/49
  if (event.request.cache === 'only-if-cached' && event.request.mode !== 'same-origin') {
    return
  }

  event.respondWith(
    // try to return untouched request from network first
    fetch(event.request).catch(async () => {
      // if it fails, try to return request from the cache
      return await caches.match(event.request).then((response) => {
        if (response) {
          return response
        }
        // if not found in cache, return default offline content for navigate requests
        if (event.request.mode === 'navigate' ||
          (event.request.method === 'GET' && event.request.headers.get('accept').includes('text/html'))) {
          console.log('[Serviceworker]', 'Fetching offline content', event)
          return caches.match('/offline.html')
        }
      })
    })
  )
}

self.addEventListener('install', onInstall)
self.addEventListener('activate', onActivate)
self.addEventListener('fetch', onFetch)
