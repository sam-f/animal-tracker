/**
 * Runs a function when the document has fully loaded
 * @param { VoidFunction } eventHandler Function to run when document is loaded.
 * @returns void
 * @example ```
 *  const myfunction = () => console.log('Document loaded');
 * documentReady(myfunction);
 * ```
 */
function documentReady (eventHandler: () => void): void {
  document.addEventListener('turbo:load', eventHandler)
}

export default documentReady
