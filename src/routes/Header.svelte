<script>
	import { page } from '$app/stores';
	import logo from '$lib/images/svelte-logo.svg';
	import github from '$lib/images/github.svg';
	import {Navbar} from 'sveltestrap'
</script>

<header>
	<nav class="navbar navbar-expand-sm navbar-dark bg-primary">
		<div class="container-fluid justify-content-center">
			
			<!-- Toggling Button (when collapsed) -->
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsable_content" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<!-- Links -->
			<ul class="navbar-nav mx-4">
				<li class="nav-item">
					<!-- Logo/Title -->
					<a class="navbar-brand" href="/"> ChainOfTrust </a>
				</li>
				<div class="collapse navbar-collapse" id="collapsable_content">
					<li class="nav-item "
						aria-current={$page.url.pathname === '/' ? 'page' : undefined}>
						
						<a class="nav-link {$page.url.pathname === '/' ? 'active' : '' }" href="/">Home</a>
					</li>
					<li class="nav-item "
						aria-current={$page.url.pathname === '/explorer' ? 'page' : undefined}>
						
						<a class="nav-link {$page.url.pathname === '/explorer' ? 'active' : '' }" href="/explorer">Explorer</a>
					</li>
					<li class="nav-item "
						aria-current={$page.url.pathname === '/contribute' ? 'page' : undefined}>
						
						<a class="nav-link {$page.url.pathname === '/contribute' ? 'active' : '' }" href="/contribute">Contribute</a>
					</li>
					<li class="nav-item "
						aria-current={$page.url.pathname === '/about' ? 'page' : undefined}>
						
						<a class="nav-link {$page.url.pathname === '/about' ? 'active' : '' }" href="/about">About</a>
					</li>
				</div>
			</ul>
		  </div>
	</nav>


	

	
		<!-- <ul>
			<li aria-current={$page.url.pathname === '/' ? 'page' : undefined}>
				<a href="/">Home</a>
			</li>
			<li aria-current={$page.url.pathname === '/about' ? 'page' : undefined}>
				<a href="/about">About</a>
			</li>
			<li aria-current={$page.url.pathname.startsWith('/sverdle') ? 'page' : undefined}>
				<a href="/sverdle">Sverdle</a>
			</li>
		</ul> -->
	


</header>