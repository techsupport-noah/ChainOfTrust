<script>
	import Header from './Header.svelte';
	import './styles.css';
	//export const ssr = false;
</script>

<div class="app min-vh-100 bg-info bg-gradient">
	<Header />

	<div class="container d-block">
		<div class="row mx-2 my-4 justify-content-center">
			<div class="col-12">
				<div class="card">
					<slot/>
				</div>
			</div>
		</div>
	</div>
	
</div>
