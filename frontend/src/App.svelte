<script>
  import { onMount } from "svelte";
  import Candidates from "./components/Candidates.svelte";
  async function connectWallet() {
    if (window.ethereum) {
      console.log("ethereum detected");
      window.web3 = new Web3(window.ethereum);
      await window.ethereum.enable();
      metamaskConnected = window.ethereum.isConnected();
    }
  }

  function onClickConnectWallet() {
    promise = connectWallet();
  }

  $: promise = connectWallet();
  $: metamaskConnected = window.ethereum && window.ethereum.isConnected();

  // onMount(async () => {
  //   console.log("App is loaded");
  //   await defaultChainStore.setBrowserProvider("http://localost:7545");

  //   console.log(await $web3.eth);
  // });
</script>

<main>
  <h2>Ethereum BlockChain Voting System</h2>
  {#if window.ethereum}
    <p>Metamaks connected</p>
  {/if}
  {#if window.ethereum && !metamaskConnected}
    <button on:click={onClickConnectWallet()}>Conenct to wallet</button>
  {/if}

  <Candidates />
</main>

<style>
  main {
    text-align: center;
    padding: 1em;
    max-width: 240px;
    margin: 0 auto;
  }

  h2 {
    color: white;
    text-transform: uppercase;
    font-size: 2em;
    font-weight: 100;
  }
  p {
    color: white;
  }

  @media (min-width: 640px) {
    main {
      max-width: none;
    }
  }
</style>
