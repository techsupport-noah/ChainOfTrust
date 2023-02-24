<script lang="ts">

	import { onMount } from "svelte";

 	var address;

	onMount(async () => {
        if (typeof window.ethereum === "undefined") {
            alert(
                "this is a decentralized app --> please install metamask or use brave.com to interact with the blockchain"
            );
        } else {
            alert("Your browserwallet is ready!");
        }
        const accounts = await ethereum.request({
            method: "eth_requestAccounts",
        });
        address = accounts[0];
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
