document.addEventListener('install', () => {
  console.log('Service Worker installing.')
})

document.addEventListener('activate', () => {
  console.log('Service Worker activated.')
})

document.addEventListener('fetch', () => {
  console.log('Service Worker fetching.')
})
