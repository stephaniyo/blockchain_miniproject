//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
// by stephaniyo
contract VotingSystem{
    //Array to store candiddate names
    string[5] public candidates;
     
     //Mapping to store the number of votes for each candidate
     mapping(string => uint256) private candidateVote;

    //Event to notify when a vote is cast
    event Votecast(string candidate, uint256 newVoteCount);

    //Constructor to initialize candidate names
    constructor(){
        candidates[0]="Cat1";
        candidates[1]="Candidate2";
        candidates[2]="Candidate3";
        candidates[3]="Candidate4";
        candidates[4]="Candidate5";
    }

    //Function to cast a vote for a candidate
    function vote(uint8 candidateIndex)public{
        require(candidateIndex <5,"Invalid candidate index");
         
        string memory selectedCandidate = candidates[candidateIndex];
        candidateVote[selectedCandidate]++;
        emit Votecast(selectedCandidate, candidateVote[selectedCandidate]);
    }

    //Function to get the current vote count for the candidate
    function getVotes(string memory candidate) public view returns (uint256){
        return candidateVote[candidate];
    }

    //Function to get all candidate names
    function getCandidateNames() public view returns (string[5]memory){
        return candidates;
    }
}

