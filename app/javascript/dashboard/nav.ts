export default (): void => {
  const navEl: HTMLElement = document.querySelector('#animalsDropDown')
  const html: HTMLElement = document.querySelector('html')

  navEl.addEventListener('click', (event: Event): void => {
    if (navEl.classList.contains('is-active')) {
      navEl.classList.remove('is-active')
    } else {
      navEl.classList.add('is-active')
    }

    event.stopPropagation()
  })

  html.addEventListener('click', (event: Event): void => {
    if (navEl.classList.contains('is-active')) {
      navEl.classList.remove('is-active')
    }
    event.stopPropagation()
  })
}
