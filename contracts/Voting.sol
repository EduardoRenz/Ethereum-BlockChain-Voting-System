pragma solidity ^0.8.0;

contract Voting {
  uint256 public totalVotes = 0;
  uint256 lastCandidateId = 0;

  // Creates a Candidate structure like interface
  struct Candidate {
    uint256 id;
    string name;
    uint256 votes;
  }
  // Define Array of candidates
  mapping(uint256 => Candidate) public candidates;

  // Create a constructor for the first time to generate candidates by default
  constructor() public {
    // Create a 3 new candidates
    createCandidate("Lula");
    createCandidate("Bolsonaro");
    createCandidate("Danilo Gentili");
  }

  // Creates a function that creates a new candidate
  function createCandidate(string memory name) public {
    // Increment number of candidate id to generate e new one
    lastCandidateId++;
    // Create a new candidate
    candidates[lastCandidateId] = Candidate(lastCandidateId, name, 0);
  }

  // Creates a function that votes for a candidate
  function vote(uint256 candidateId) public {
    // Check if candidate exists
    require(candidates[candidateId].id != 0);
    // Increment votes
    candidates[candidateId].votes++;
    // Increment total votes
    totalVotes++;
  }
}
