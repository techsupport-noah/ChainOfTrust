<script>
	import Header from './Header.svelte';
	import './styles.css';
	//export const ssr = false;
</script>

<div class="app">
	<Header />

	<main>
		<slot />
	</main>

	<footer>
		<p>Das hier ist der Standard Footer.</p>
	</footer>
</div>
