<svelte:head>
	<title>Contribute History based</title>
	<meta name="description" content="Contribute to the project" />
</svelte:head>

<div class="card-body">
    <div class="accordion accordion-flush" id="accordionExample">
        <div class="accordion-item">
          <h2 class="accordion-header" id="headingOne">
            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
              Select a wallet id you interacted with.
            </button>
          </h2>
          <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
            <div class="accordion-body">
              <!-- Addr selector based on wallet history -->
                <div class="input-group mb-3">
                    <select class="form-select" id="inputGroupSelect02">
                    <option selected>Choose...</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                    </select>
                    <label class="input-group-text" for="inputGroupSelect02">Options</label>
                </div>
            </div>
          </div>
        </div>
        <div class="accordion-item">
          <h2 class="accordion-header" id="headingTwo">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
              Describe your experience with this wallet.
            </button>
          </h2>
          <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
            <div class="accordion-body">
                <!-- Description Input Form -->
                <div class="input-group mb-3">
                    <span class="input-group-text">Description</span>
                    <textarea class="form-control" aria-label="With textarea"></textarea>
                </div>
            </div>
          </div>
        </div>
      </div>

    <!-- Submit Button -->
    <button type="button" class="btn btn-primary">Submit</button>
    
</div>