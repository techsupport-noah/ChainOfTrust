<script lang="ts">
    import Search from "svelte-bootstrap-icons/lib/Search.svelte";
    import Award from "svelte-bootstrap-icons/lib/Award.svelte";
    import ExclamationOctagon from "svelte-bootstrap-icons/lib/ExclamationOctagon.svelte";
    import HandThumbsUp from "svelte-bootstrap-icons/lib/HandThumbsUp.svelte";

    import { fade } from "svelte/transition";

    let searchinput_value: String;

    function handleButtonClick() 
    {
        // get search value
        searchinput_value = (<HTMLInputElement>document.getElementById("searchinput")).value;
        
        // show results
        if (searchinput_value != "")
        {
            let element = document.getElementById("collapseOne")!;
            element.classList.add("show");
        }
    }

    function handleKeydown(e: { key: any; }) {
		 if (e.key == "Enter")
         {
            handleButtonClick();
         }
	}
</script>

<svelte:head>
	<title>Explorer</title>
	<meta name="description" content="Explorepage" />
</svelte:head>

<div class="card-header h4 bg-secondary text-center">Discover the Trustworthiness of ETH Wallets - Find Your Score Today!</div>

<div class="card-body" in:fade={{duration : 150}}>
    <div class="container-fluid">

        <!-- Searchbar -->
        <div class="row justify-content-center">
            <div class="col-12 justify-content-center">
                <div class="input-group mt-2 mb-3">
                    <input type="text" class="form-control" on:keydown={handleKeydown} placeholder="Search for wallet address..." id = "searchinput"> 
                    <button class="btn btn-primary" on:click={handleButtonClick}><Search/></button>
                </div>
            </div> 
        </div>

        <!-- Collapsable Results -->
        <div class="container-fluid">
            <div id="collapseOne" class="card collapse" aria-labelledby="headingOne">
                <div class="row">
                    <div class="col-12">
                        <div class="float-left mt-2 mb-3 ml-2">Trustscore found for: {searchinput_value}</div>
                    </div>
                </div>

                <div class="row no-gutters mb-5">
                    <div class="col-auto">

                        <!-- Scores -->
                        <ul class="list-group">
                            <li class="list-group-item border-0">
                                <div class="row">
                                    <div class="col-2 justify-content-start">
                                        <Award width=24 height=24/>
                                    </div>
                                    <div class="col-10">
                                        Score: 100
                                    </div>
                                </div>
                            </li>
                            <li class="list-group-item border-0">
                                <div class="row">
                                    <div class="col-2 justify-content-start">
                                        <HandThumbsUp width=24 height=24/>
                                    </div>
                                    <div class="col-10">
                                        Recommended: 50
                                    </div>
                                </div>
                            </li>
                            <li class="list-group-item border-0">
                                <div class="row">
                                    <div class="col-2 justify-content-start">
                                        <ExclamationOctagon width=22 height=22 />
                                    </div>
                                    <div class="col-10">
                                        Warnings: 0
                                    </div>
                                </div>
                            </li>
                        </ul>                        
                    </div>

                    <div class="col mr-2">

                        <!-- Reviews -->
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item border-primary">
                                Most common reason..
                            </li>
                            <li class="list-group-item border-primary">
                                Second most common reason...
                            </li>
                            <li class="list-group-item border-primary">
                                Third most common reason...
                            </li>
                        </ul>          

                    </div>
                </div>
            </div>
        </div>
    </div>  
</div>