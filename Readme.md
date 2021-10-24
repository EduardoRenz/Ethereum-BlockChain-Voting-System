# Voting system using Ethereum Blockchain


![image](https://user-images.githubusercontent.com/13971001/138585882-db627d55-6a79-4825-8535-44261b331227.png)



## About the project

A Simple Voting system using Blockchain using Ethereum Smart Contracts with Solidity and Svelte


## Blockchain

Blockchain is a system of recording information in a way that makes it difficult or impossible to change, hack, or cheat the system. A blockchain is essentially a digital ledger of transactions that is duplicated and distributed across the entire network of computer systems on the blockchain.
[Euromoney](https://www.euromoney.com/learning/blockchain-explained/what-is-blockchain)


## Ethereum

Ethereum is a decentralized, open-source blockchain with smart contract functionality. Ether is the native cryptocurrency of the platform. Amongst cryptocurrencies, Ether is second only to Bitcoin in market capitalization. Ethereum was conceived in 2013 by programmer Vitalik Buterin
[Wikipedia](https://en.wikipedia.org/wiki/Ethereum)

### Requirements

- Install ganache to create a local ethereum blockchain
- Install MetaMask extension in browser to connect to a network
- Install node
- Install truffle via npm

### How to :

- Create contracts in contracts folder
- Run `truffle compile ` to compile contracts
- Create a new migration in migrations folder
- Run `truffle migrate` or `truffle migrate --reset` to reset to a new deployiment if needed
- Can see log with `truffle console` and `voting = await Voting.deployed()` to get a copy of this contract
- `voting.totalVotes()` to get current total votes

### Source of knowlege

https://youtu.be/coQ5dg8wM2o
https://youtu.be/jQ1rK2vlEAU
