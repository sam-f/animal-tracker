export default (): void => {
  const weightRecordFields: HTMLElement = document.querySelector('.animal-weight-record-fields')
  const addWeightRecordButton: HTMLButtonElement = document.querySelector('.add-weight-record')
  const weightRecordInputs: HTMLInputElement[] = Array.from(document.querySelectorAll('[data-weight-record]'))

  function changeDisabledAttribute (value: boolean): void {
    weightRecordInputs.forEach((input: HTMLInputElement): void => {
      input.disabled = value
    })
  }

  addWeightRecordButton?.addEventListener('click', (): void => {
    if (weightRecordFields.style.display === 'none') {
      addWeightRecordButton.textContent = 'Remove'
      addWeightRecordButton.classList.remove('is-primary')
      addWeightRecordButton.classList.add('is-danger')

      weightRecordFields.style.display = 'block'

      changeDisabledAttribute(false)
    } else {
      addWeightRecordButton.textContent = 'Add current weight (optional)'
      addWeightRecordButton.classList.add('is-primary')
      addWeightRecordButton.classList.remove('is-danger')

      weightRecordFields.style.display = 'none'

      changeDisabledAttribute(true)
    }
  })
}
