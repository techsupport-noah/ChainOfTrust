<svelte:head>
	<title>Contribute Trust based</title>
	<meta name="description" content="Contribute to the project" />
</svelte:head>

<div class="card-body">
	<div class="accordion accordion-flush" id="accordionExample2">
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingOne">
			<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
				What wallet do you want to contribute about?
			</button>
			</h2>
			<div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample2">
				<div class="accordion-body">
					<!-- Addr selector based on wallet history -->
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="Wallet address..."> 
					</div>
				</div>
			</div>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingTwo">
			<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
				Describe your experience with this wallet.
			</button>
			</h2>
			<div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample2">
				<div class="accordion-body">
					<!-- Description Input Form -->
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="Description..."> 
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Submit Button -->
    <button type="button" class="btn btn-primary">Submit</button>
</div>