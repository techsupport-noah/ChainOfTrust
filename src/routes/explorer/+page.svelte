<script>
  import Search from "svelte-bootstrap-icons/lib/Search.svelte";
</script>


<svelte:head>
	<title>Explorer</title>
	<meta name="description" content="Explorepage" />
</svelte:head>


<div class="card-header h4 bg-secondary text-center">Discover the Trustworthiness of ETH Wallets - Find Your Score Today!</div>

<div class="card-body">
    <div class="container-fluid">

        <div class="row justify-content-center">
        
            <div class="col-11 justify-content-center">
                <input type="text" class="form-control" placeholder="Search for wallet address..."> 
            </div>
            <div class="col-1-auto text-center">
                <button class="btn btn-primary btn-block"><Search width={22} height={22}/></button>
            </div>
        </div>

    </div>    
</div>

