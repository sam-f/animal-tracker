export function requestNotifications () {
  const notificationCheck: HTMLInputElement = document.querySelector('#notification_check')
  const notificationPermission: string = document.querySelector<HTMLMetaElement>('meta[name="notification_permission"]').getAttribute('content')

  if (!notificationCheck) return

  notificationCheck.addEventListener('change', () => {
    if (notificationCheck.checked) {
      window.Notification.requestPermission().then(permission => {
        if (permission !== 'granted') {
          console.log('[push notifications]', 'permission not granted')
        }
      })
    }
  })
}
