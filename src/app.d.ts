import type { MetaMaskInpageProvider } from "@metamask/providers";

declare global {
	namespace App {
		// interface Error {}
		// interface Locals {}
		// interface PageData {}
		// interface Platform {}
	}
	interface Window {
        ethereum?:MetaMaskInpageProvider
    }
}

export {};
