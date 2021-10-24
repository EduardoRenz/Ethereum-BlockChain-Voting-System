<script>
  import { Web3 } from "svelte-web3";
  import { onMount } from "svelte";
  import Candidates from "../contracts/Voting.json";
  import Candidate from "./Candidate.svelte";

  let web3 = new Web3(window.ethereum);

  onMount(async () => {
    number_of_candidates = await getCandidates();
  });

  async function getCandidates() {
    const networkId = await web3.eth.net.getId();
    const deployedNetwork = Candidates.networks[networkId];
    const contract = new web3.eth.Contract(
      Candidates.abi,
      deployedNetwork && deployedNetwork.address
    );
    return contract.methods.lastCandidateId().call();
  }

  $: number_of_candidates = "loading";
</script>

<header>
  <h3>Number of Candidates : {number_of_candidates}</h3>
</header>

<section>
  {#each { length: number_of_candidates } as _, i}
    <Candidate id={i + 1} />
  {/each}
</section>

<style>
  section {
    display: flex;

    align-items: center;
    justify-content: center;
    margin: 0 auto;
    max-width: 600px;
  }
</style>
