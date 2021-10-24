<script>
  import { onMount } from "svelte";
  import Candidates from "../contracts/Voting.json";

  export let id;
  $: candidate = {};

  let web3 = new Web3(window.ethereum);

  onMount(async () => {
    candidate = await getCandidate(id);
  });

  async function getCandidate(number) {
    const networkId = await web3.eth.net.getId();
    const deployedNetwork = Candidates.networks[networkId];
    const contract = new web3.eth.Contract(
      Candidates.abi,
      deployedNetwork && deployedNetwork.address
    );
    return contract.methods.candidates(number).call();
  }

  async function vote(candidate_id) {
    console.log("voting on", candidate_id);
    const networkId = await web3.eth.net.getId();
    const deployedNetwork = Candidates.networks[networkId];
    const contract = new web3.eth.Contract(
      Candidates.abi,
      deployedNetwork && deployedNetwork.address
    );
    await contract.methods
      .vote(candidate_id)
      .send({ from: window.ethereum.selectedAddress });

    candidate = await getCandidate(id);
  }
</script>

<div class="card">
  <h3>Candidate {id}</h3>
  <h4>Name : {candidate.name}</h4>
  <h4>Votes : {candidate.votes}</h4>
  <button on:click={vote(id)}>Vote</button>
</div>

<style>
  h3 {
    text-align: center;
    color: rgb(15, 15, 15);
  }
  h4 {
    text-align: center;
    color: rgb(15, 15, 15);
  }

  .card {
    color: rgb(15, 15, 15);
    margin: auto;
    margin-top: 50px;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 10px;
    height: 100%;
    background-color: white;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  }
</style>
