import { optionsForFetch } from '../helpers/optionsForFetch'

interface ProfileResponse {
  data: {
    id: number
    type: 'users'
    attributes: {
      push_notifications: boolean
    }
  }
}

async function updateUserWith (permission: boolean): Promise<unknown> {
  return await fetch('/dashboard/api/users', optionsForFetch(JSON.stringify({
    permission
  }), 'POST')).then(parseJson)
}

async function parseJson (response: Response): Promise<unknown> {
  return await response.json()
}

export async function requestNotifications (): Promise<void> {
  const notificationCheck: HTMLInputElement = document.querySelector('#notification_check')

  if (notificationCheck === null) return

  const json: ProfileResponse = await fetch(
    '/dashboard/api/users/profile',
    optionsForFetch(null, 'GET')
  )
    .then(parseJson)
    .catch((err) => {
      console.log(err)
    })

  notificationCheck.checked = json.data.attributes.push_notifications

  notificationCheck.addEventListener('change', async (): Promise<void> => {
    if (notificationCheck.checked) {
      const permission = await window.Notification.requestPermission()

      if (permission !== 'granted') {
        console.log('[push notifications]', 'permission not granted')

        await updateUserWith(true)
      }
    } else {
      await updateUserWith(false)
    }
  })
}
