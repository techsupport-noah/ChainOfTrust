<script lang="ts">
	import { onMount } from "svelte";
	import './styles.css';
	import Explorer from "./pages/Explorer.svelte";
	import Contribute from "./pages/Contribute.svelte";
	import About from "./pages/About.svelte";
	
 	var address : any;

	 onMount(async () => {
		//check if metamask is installed
		const { ethereum } = window;

		if (!ethereum) 
		{
			alert("Please install MetaMask for this application to work.");
		}
		else{
			console.log("MetaMask is installed");
		}
	});
	//on component loaded
	onMount(async () => {
		//get eth accounts
		const accounts = await window.ethereum.request({
			method: "eth_requestAccounts",
		});

		// const accounts = await window.ethereum.request({
		// 	method: "eth_accounts",
		// });
		// console.log(accounts);
		//check if user has eth wallets
		switch(accounts.length) {
			case 0:
				alert("Not eth wallets found.");
				break;
			case 1:
				address = accounts[0];
				break;
			default:
				alert("Multiple eth accounts found. Using first account.")
				address = accounts[0];
		}
		
	});

	let collapseArray : HTMLElement[];

	onMount(async () => {
		collapseArray = [document.getElementById("collapseHome"),
					document.getElementById("collapseExplorer"),
					document.getElementById("collapseContribute"),
					document.getElementById("collapseAbout")
		];
	});

	function handleButtonClick(event) 
    {
		const id = event.target.value;
		collapseArray.forEach(element => {
			if (element.id == id)
			{
				element.classList.add("show");
			}
			else
			{
				element.classList.remove("show");
			}
		});
    }

</script>

<div class="app min-vh-100 bg-info bg-gradient">

	<header>
		<nav class="navbar navbar-expand-sm navbar-dark bg-primary bg-gradient">
			<div class="container-fluid justify-content-center">
	
				<!-- Links -->
				<ul class="navbar-nav mx-4">
					<li class="nav-item">

						<!-- Logo/Title -->
						<button class="navbar-brand btn" on:click={handleButtonClick}  value={"collapseHome"} 
						type="button" aria-expanded="false" aria-controls="collapseHome"> ChainOfTrust </button>
					</li>
					<div class="collapse navbar-collapse" id="collapsable_content">
						<li class="nav-item ">
							
							<button class="nav-link active btn border-0" on:click={handleButtonClick}  value={"collapseHome"} 
							type="button" aria-expanded="false" aria-controls="collapseHome">Home</button>
						</li>
						<li class="nav-item ">
							
							<button class="nav-link active btn border-0" on:click={handleButtonClick}  value={"collapseExplorer"} 
							type="button" aria-expanded="false" aria-controls="collapseExplorer">Explorer</button>
						</li>
						<li class="nav-item ">
	
							<button class="nav-link active btn border-0" on:click={handleButtonClick}  value={"collapseContribute"} 
							type="button" aria-expanded="false" aria-controls="collapseContribute">Contribute</button>
						</li>
						<li class="nav-item ">
	
							<button class="nav-link active btn border-0" on:click={handleButtonClick}  value={"collapseAbout"} 
							type="button" aria-expanded="false" aria-controls="collapseContribute">About</button>
						</li>
					</div>
				</ul>
			  </div>
		</nav>
	</header>
	
	<div class="container d-block">
		<div class="row mx-2 my-4 justify-content-center">
			<div class="col-12">

				<!-- Home -->
				<div class="collapse show" id="collapseHome">
					<div class="card">

						<div class="card-header h4 bg-secondary">Info</div>
	
						<div class="card-body">
							<p class="card-text">Your wallet address is: {address}.</p>
							<a href="#" class="btn btn-primary">Fuck yeah.</a>
						</div>
					</div>
				</div>

				<!-- Explorer -->
				<div class="collapse" id="collapseExplorer">
					<div class="card">
						<Explorer/>
					</div>
				</div>

				<!-- Contribute -->
				<div class="collapse" id="collapseContribute">
					<div class="card">
						<Contribute/>
					</div>
				</div>

				<!-- About -->
				<div class="collapse" id="collapseAbout">
					<div class="card">
						<About/>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>
