export function CSRFToken (): string {
  return document.querySelector<HTMLMetaElement>('meta[name="csrf-token"]')?.getAttribute('content')
}
