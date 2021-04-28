// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from '@rails/ujs'
import * as ActiveStorage from '@rails/activestorage'
import 'channels'
import 'controllers'
import documentReady from 'helpers/documentReady'
import { requestNotifications } from 'dashboard/requestNotifications'

Rails.start()
ActiveStorage.start()

window.addEventListener('load', () => {
  navigator.serviceWorker.register('/service-worker.js', { scope: '/dashboard/' }).then(registration => {
    console.log('ServiceWorker registered: ', registration)
  }).catch(registrationError => {
    console.log('Service worker registration failed: ', registrationError)
  })
})

documentReady(() => {
  requestNotifications();
})
