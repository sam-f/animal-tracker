/**
 * DOMEvent - used to allow interaction with HTMLElements from Event.Target
 * @example document.addEventListener('click', (event: DOMEvent<HTMLElement>) => event.target.id);
 */
export interface DOMEvent<T extends EventTarget> extends Event {
  target: T
}
