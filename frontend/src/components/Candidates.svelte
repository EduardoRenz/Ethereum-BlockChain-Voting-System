<script>
  import { Web3 } from "svelte-web3";
  import Candidates from "../contracts/Voting.json";
  import { onMount } from "svelte";

  let web3 = new Web3(window.ethereum);

  async function getCandidates() {
    const networkId = await web3.eth.net.getId();
    const deployedNetwork = Candidates.networks[networkId];
    const contract = new web3.eth.Contract(
      Candidates.abi,
      deployedNetwork && deployedNetwork.address
    );
    console.log(contract.methods);
    return contract.methods.lastCandidateId().call();
  }

  async function getCandidate(number) {
    const networkId = await web3.eth.net.getId();
    const deployedNetwork = Candidates.networks[networkId];
    const contract = new web3.eth.Contract(
      Candidates.abi,
      deployedNetwork && deployedNetwork.address
    );
    return contract.methods.candidates(number).call();
  }
</script>

{#await getCandidates()}
  <h1>Loading</h1>
{:then number_of_candidates}
  <h3>Number of Candidates : {number_of_candidates}</h3>

  {#each { length: number_of_candidates } as _, i}
    <div>
      <h3>Candidate {i + 1}</h3>

      {#await getCandidate(i + 1) then candidate}
        <h4>Name : {candidate.name}</h4>
        <h4>Votes : {candidate.votes}</h4>
      {:catch}
        <h4>Candidate not found</h4>
      {/await}
    </div>
  {/each}
{/await}

<style>
  h3 {
    color: white;
  }
</style>
