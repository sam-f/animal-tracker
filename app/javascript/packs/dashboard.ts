// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from '@rails/ujs'
import * as ActiveStorage from '@rails/activestorage'
import 'channels'
import 'controllers'

Rails.start()
ActiveStorage.start()

document.addEventListener('turbo:load', () => {
  navigator.serviceWorker.register('/service-worker.js', { scope: '/dashboard/' }).then(registration => {
    console.log('ServiceWorker registered: ', registration)

    if (registration.installing) {
      console.log('Service worker installing.')
    } else if (registration.waiting) {
      console.log('Service worker installed & waiting.')
    } else if (registration.active) {
      console.log('Service worker active.')
    }
  }).catch(registrationError => {
    console.log('Service worker registration failed: ', registrationError)
  })
})
