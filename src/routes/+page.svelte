<script lang="ts">

	import { onMount } from "svelte";
	
 	var address : any;

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


</script>

<svelte:head>
	<title>Home</title>
	<meta name="description" content="Startpage" />
</svelte:head>

<div class="card-header h4 bg-secondary">Info</div>

<div class="card-body">
    <p class="card-text">Your wallet address is: {address}.</p>
    <a href="#" class="btn btn-primary">Fuck yeah.</a>
</div>
