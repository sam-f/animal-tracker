import { HTTPMethod } from '../types/HTTPMethod'
import { CSRFToken } from './CSRFToken'

export function optionsForFetch (body: BodyInit, method: HTTPMethod): RequestInit {
  return ({
    method,
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'X-CSRF-Token': CSRFToken()
    },
    body,
    credentials: 'same-origin'
  })
}
