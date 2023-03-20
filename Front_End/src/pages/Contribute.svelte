<script lang="ts">
    import { fade } from 'svelte/transition';

    let inputWallet: string = "";
    let inputReason = {id:0, text:"Select ..."};
    let inputExperience = {id:0, text:"Select ..."};

    console.log(inputReason.id)
    console.log(inputExperience.id)

    let reason = [
        {id:0, text:"Select ..."},
        {id:1, text:"Positive"},
        {id:2, text:"Negative"}
    ]
     
    let experience = [
        {id:0, text:"Select ..."},
        {id:1, text:"Great experience"},
        {id:2, text:"General scam"},
        {id:2, text:"Bad communication"},
        {id:2, text:"Other"},
    ]

    function submit() {
        // get input values
        let indexExperience = (<HTMLSelectElement>document.getElementById('inputExperience')).value;
        let indexReason = (<HTMLSelectElement>document.getElementById('inputReason')).value;
        console.log(inputWallet);
        console.log(indexReason)
        console.log(indexExperience)
    }
    
</script> 

<div class="content" >
  <div class="card-body">
      What wallet do you want to contribute about?
      
      <!-- Addr selector -->
      <div class="input-group mb-3">
        <input type="text" class="form-control" placeholder="Wallet address..." bind:value={inputWallet}> 
      </div>
          
      Please select the nature of your contribution.
       
      <!-- Score Input Form -->
      <div class="input-group mb-3">
        <select class="custom-select" id="inputReason" :value={inputReason.id}>
          {#each reason as e}
            <option value={e.id}>{e.text}</option>
          {/each}
        </select>
      </div>

      Describe your experience with this wallet.
       
      <!-- Description Input Form -->
      <div class="input-group mb-3">
        <select class="custom-select" id="inputExperience" :value={inputExperience.id}>
            {#each experience as e}
              <option value={e.id}>{e.text}</option>
            {/each}
          </select>
      </div>
      
      <!-- Submit Button -->
      <button type="button" on:click={submit} class="btn btn-primary">Submit</button>
  </div>
</div>
