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

        <!-- Searchbar -->
        <div class="row justify-content-center">
            <div class="col-12 justify-content-center">
                <div class="input-group mt-2 mb-3">
                    <input type="text" class="form-control" placeholder="Search for wallet address..."> 
                    <button class="btn btn-primary" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"><Search/></button>
                </div>
            </div> 
        </div>

        <!-- Collapsable Results -->
        <div class="container-fluid">
            <div id="collapseOne" class="card collapse" aria-labelledby="headingOne">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="float-left mt-2 mb-3 ml-2">X results found for: Wallet Address</div>
                    </div>
                </div>

                <!-- Switch Pages -->
                <div class="row">
                    <div class="col-12">
                        <ul class="pagination justify-content-center">
                            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">Next</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>  
</div>