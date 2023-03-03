<script>
    import { page } from '$app/stores';

    import Contribute_History from './contribute_history/Contribute_History.svelte';
    import Contribute_Trust from './contribute_trust/Contribute_Trust.svelte';

</script>



<ul class="nav nav-tabs">
    <li class="nav-item">
      <a class="nav-link active" href="#history" data-bs-toggle="tab" data-bs-target="#history">History based</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#trust" data-bs-toggle="tab" data-bs-target="#trust">TrustScore based</a>
    </li> 
</ul>
<div class="tab-content">
    <div id="history" class="tab-pane fade" ><Contribute_History></Contribute_History></div>
    <div id="trust" class="tab-pane fade"><Contribute_Trust></Contribute_Trust></div>
</div>
