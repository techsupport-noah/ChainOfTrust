import App from './App.svelte'
import type { MetaMaskInpageProvider } from "@metamask/providers";

declare global {
    interface Window {
        ethereum?:MetaMaskInpageProvider
    }
}
const app = new App({
  target: document.getElementById('app'),
})

export default app