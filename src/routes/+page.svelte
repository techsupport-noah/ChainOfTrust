<script lang="ts">

	import { onMount } from "svelte";

 	var address;

	//on component loaded
	onMount(async () => {
        if (typeof window.ethereum === "undefined") {
            alert(
				"Please install MetaMask to use this dapp!"
			);
        } else {
			//check if user is connected to MetaMask
			const accounts = await window.ethereum.request({
				method: "eth_accounts",
			});
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
		}
	});


</script>

<svelte:head>
	<title>Home</title>
	<meta name="description" content="Svelte demo app" />
</svelte:head>

<section>
	<h1>
		<h1>Your wallet address is: {address}</h1>
	</h1>
</section>

<style>
	section {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		flex: 0.6;
	}

	h1 {
		width: 100%;
	}

	.welcome {
		display: block;
		position: relative;
		width: 100%;
		height: 0;
		padding: 0 0 calc(100% * 495 / 2048) 0;
	}

	.welcome img {
		position: absolute;
		width: 100%;
		height: 100%;
		top: 0;
		display: block;
	}
</style>
