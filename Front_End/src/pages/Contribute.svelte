<script lang="ts">
    import Web3 from 'web3';

    let contractABI = "";//TODO: Add ABI here
    let contractAddr = "";//TODO: Add Contract Address here

    let defaultSelectPlaceholder = {id:0, text:"Select ..."};
    let defaultInputPlaceholder = "Bitte geben Sie die Wallet ID ein.";
    
    let inputWallet: string = "";
    let inputReason = defaultSelectPlaceholder;
    let inputExperience = defaultSelectPlaceholder;

    let indexExperience;
    let indexReason;

    let reason = [
        defaultSelectPlaceholder,
        {id:1, text:"Positive"},
        {id:2, text:"Negative"}
    ]
     
    let experience = [defaultSelectPlaceholder];

    let experiencePositive = [
        defaultSelectPlaceholder,
        {id:1, text:"Great experience"},
    ]

    let experienceNegative = [
        defaultSelectPlaceholder,
        {id:2, text:"General scam"},
        {id:3, text:"Bad communication"},
        {id:4, text:"Other"},
    ]

    function submit() {
        // get input values
        indexExperience = (<HTMLSelectElement>document.getElementById('inputExperience')).value;
        indexReason = (<HTMLSelectElement>document.getElementById('inputReason')).value;
        
        if (indexExperience != 0 && indexReason != 0 && inputWallet != "")
        {
          console.log("Submit!")
          console.log(inputWallet)
          console.log(indexReason)
          console.log(indexExperience)
          let web3 = new Web3(window.ethereum);		
          let contractInstance = new web3.eth.Contract(contractABI, contractAddr);
          contractInstance.methods.createNewRating(inputWallet, indexExperience)
        }
        else
        {
          //TODO add modal to show error message!
          console.log("Please fill all the forms!")
        }
    }

    function handleReasonChange()
    {
      // get current reason
      indexReason = (<HTMLSelectElement>document.getElementById('inputReason')).value;

      if(indexReason == 0)
      {
        // disable Experience Input
        (<HTMLSelectElement>document.getElementById('inputExperience')).disabled = true;
      }
      else if (indexReason == 1)
      {
        // enable Experience Input
        (<HTMLSelectElement>document.getElementById('inputExperience')).disabled = false;

        experience = experiencePositive;
      }
      else
      {
        // enable Experience Input
        (<HTMLSelectElement>document.getElementById('inputExperience')).disabled = false;
        experience = experienceNegative;
      }

      // reset Experience Selection
      (<HTMLSelectElement>document.getElementById('inputExperience')).selectedIndex = 0;
    }
    
</script> 

<div class="content" >
  <div class="card-body">
      What wallet do you want to contribute about?
      
      <!-- Addr selector -->
      <div class="input-group mb-3">
        <input type="text" class="form-control" placeholder= {defaultInputPlaceholder} bind:value={inputWallet}> 
      </div>
          
      Please select the nature of your contribution.
       
      <!-- Score Input Form -->
      <div class="input-group mb-3">
        <select class="custom-select" id="inputReason" :value={inputReason.id} on:change={handleReasonChange}>
          {#each reason as e}
            <option value={e.id}>{e.text}</option>
          {/each}
        </select>
      </div>

      Describe your experience with this wallet.
       
      <!-- Description Input Form -->
      <div class="input-group mb-3">
        <select class="custom-select" id="inputExperience" :value={inputExperience.id} disabled>
            {#each experience as e}
              <option value={e.id}>{e.text}</option>
            {/each}
          </select>
      </div>
      
      <!-- Submit Button -->
      <button type="button" on:click={submit} class="btn btn-primary">Submit</button>
  </div>
</div>
