<script>
    import { page } from '$app/stores';
    import { fade } from 'svelte/transition';

   
    
    

</script>


<svelte:head>
  <title>Contribute Trust based</title>
  <meta name="description" content="Contribute to the project" />
</svelte:head>  

<div class="content" in:fade={{ duration: 150 }}>
  <div class="card-body">
      What wallet do you want to contribute about?
      
      <!-- Addr selector based on wallet history -->
      <div class="input-group mb-3">
        <input type="text" class="form-control" placeholder="Wallet address..."> 
      </div>
          
      Describe your experience with this wallet.
       
      <!-- Description Input Form -->
      <div class="input-group mb-3">
        <input type="text" class="form-control" placeholder="Description..."> 
      </div>
          
      <!-- Submit Button -->
      <button type="button" class="btn btn-primary">Submit</button>
  </div>
</div>
