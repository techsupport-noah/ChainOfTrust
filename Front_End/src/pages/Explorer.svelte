<script lang="ts">
    import Search from "svelte-bootstrap-icons/lib/Search.svelte";
    import Award from "svelte-bootstrap-icons/lib/Award.svelte";
    import ExclamationOctagon from "svelte-bootstrap-icons/lib/ExclamationOctagon.svelte";
    import HandThumbsUp from "svelte-bootstrap-icons/lib/HandThumbsUp.svelte";
    import Web3 from 'web3';
    import { onMount } from "svelte";
    import { fade } from "svelte/transition";

    let contractABI = "";//TODO: Add ABI here
    let contractAddr = "";//TODO: Add Contract Address here

    let web3;
    let contractInstance;
    onMount(async () => {
        web3 = new Web3(window.ethereum);		
        contractInstance = new web3.eth.Contract(contractABI, contractAddr);
	});

    
    let searchinput_value: String;

    // variables for displaying the ratings
    let ratings : Number[];
    let goodRating: Number;
    let scam : Number;
    let badCommunication : Number;
    let other : Number;
    let score;

    // varaibles for diyplaying the most common reviews
    let mostCommon = [];
    let secondMostCommon = [];
    let thirdMostCommon = [];

    function handleButtonClick() 
    {
        // get search value
        searchinput_value = (<HTMLInputElement>document.getElementById("searchinput")).value;
        
        // show results
        if (searchinput_value != "")
        {
            let element = document.getElementById("collapseOne")!;
            element.classList.add("show");

            getRatings();
            getMostCommon();
        }
    }

    function handleKeydown(e: { key: any; }) {
		 if (e.key == "Enter")
         {
            handleButtonClick();
         }
	}

    function getRatings(){
        // ["Good Rating","General Scam","Bad Communication","Other"]
        ratings = contractInstance.methods.get(searchinput_value);
            
        // parse ratings to display them
        goodRating = ratings[0];
        scam = ratings[1];
        badCommunication = ratings[2];
        other = ratings[3];
        
        //TODO define good formula to calculate score
        score = 2*+goodRating - +(+scam + 0.5 * +badCommunication);
    }

    function getMostCommon()
    {
        let max = 0;
        let secondmax = 1;
        let thirdmax = 2;

        console.log(ratings)
        for(let i = 1; i < ratings.length; i++)
        {
            if(ratings[i] > ratings[max]){
                thirdmax = secondmax;
                secondmax = max;
                max = i;
            }
            else if (ratings[i] > ratings[secondmax])
            {
                thirdmax = secondmax;
                secondmax = i;
            }
            else if (ratings[i] > ratings[thirdmax])
            {
                 thirdmax = i;
            }
        }

        // get index and count of most common reviews
        mostCommon[0] = max;
        mostCommon[1] = ratings[max];

        secondMostCommon[0] = secondmax;
        secondMostCommon[1] = ratings[secondmax];

        thirdMostCommon[0] = thirdmax;
        thirdMostCommon[1] = ratings[thirdmax];
    }
</script>

        
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

                <div class="row no-gutters mb-5 mt-3 justify-content-center">

                    <!-- Reviews -->
                    <div class="col-8 ml-4">
                        <div class="row">
                            <div class="">Most common review descriptions:</div>
                        </div>
                        
                        <div class="row mt-3">
                            <ul class="list-group list-group-flush">

                                <!-- Most Common Review -->
                                <li class="list-group-item border-primary">
                                    <div class="row">
                                        <div class="col-auto justify-content-start">
                                            1.
                                        </div>
                                        <div class="col-4 justify-content-start">
                                            <!-- get Description of most common review -->
                                            {contractInstance.methods.scoreMessage(mostCommon[0])}:
                                        </div>
                                        <div class="col-auto justify-content-start">
                                            <!-- get count of most common review -->
                                            {mostCommon[1]}
                                        </div>
                                    </div> 
                                </li>

                                <!-- Second Most Common Review -->
                                <li class="list-group-item border-primary">
                                    <div class="row">
                                        <div class="col-auto justify-content-start">
                                            2.
                                        </div>
                                        <div class="col-4 justify-content-start">
                                            {contractInstance.methods.scoreMessage(secondMostCommon[0])}:
                                        </div>
                                        <div class="col-auto justify-content-start">
                                            {secondMostCommon[1]}
                                        </div>
                                    </div>
                                </li>

                                <!-- Third Most Common Review -->
                                <li class="list-group-item border-primary">
                                    <div class="row">
                                        <div class="col-auto justify-content-start">
                                            3.
                                        </div>
                                        <div class="col-4 justify-content-start">
                                            {contractInstance.methods.scoreMessage(thirdMostCommon[0])}:
                                        </div>
                                        <div class="col-auto justify-content-start">
                                            {thirdMostCommon[1]}
                                        </div>
                                    </div>
                                </li>
                            </ul>  
                        </div>       
                    </div>

                    <!-- Scores -->
                    <div class="col-auto ml-4">
                        <ul class="list-group">

                            <!-- Score -->
                            <li class="list-group-item border-0">
                                <div class="row mt-5">
                                    <div class="col-2 justify-content-start">
                                        <Award width=24 height=24/>
                                    </div>
                                    <div class="col-10">
                                        Score: {score}
                                    </div>
                                </div>
                            </li>

                            <!-- Recommendations -->
                            <li class="list-group-item border-0">
                                <div class="row">
                                    <div class="col-2 justify-content-start">
                                    <HandThumbsUp width=24 height=24/>
                                    </div>
                                    <div class="col-10">
                                        Recommended: {goodRating}
                                    </div>
                                </div>
                            </li>

                            <!-- Warnings -->
                            <li class="list-group-item border-0">
                                <div class="row">
                                    <div class="col-2 justify-content-start">
                                        <ExclamationOctagon width=22 height=22 />
                                    </div>
                                    <div class="col-10">
                                        Warnings: {+scam + +badCommunication}
                                    </div>
                                </div>
                            </li>

                        </ul> 
                    </div>  
                </div>
            
            </div>

        </div>
    </div>
</div>