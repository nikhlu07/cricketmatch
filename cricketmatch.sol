// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CricketMatch {
    address public owner;
    mapping(address => uint256) public playerScores;
    uint256 public totalTeamScore;
    bool public matchEnded;
    address[] public players;
    uint256 public contractBalance; // Track the contract's balance

    constructor() {
        owner = msg.sender;
        matchEnded = false;
        contractBalance = 0; 
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner.");
        _;
    }

    modifier matchInProgress() {
        require(!matchEnded, "The cricket match has already ended.");
        _;
    }

    function registerPlayer() public {
        require(!matchEnded, "Cannot register players after the match has ended.");
        require(playerScores[msg.sender] == 0, "You are already registered as a player.");
        require(players.length < 11, "The maximum number of players (11) has been reached.");
        players.push(msg.sender);
    }

    function submitScore(uint256 score) public matchInProgress {
        require(!matchEnded, "Cannot submit scores after the match has ended.");
        require(score >= 0 && score <= 100, "Invalid score. It should be between 0 and 100.");
        require(playerScores[msg.sender] + score <= 100, "Player cannot exceed 100 runs.");
        playerScores[msg.sender] += score;
        totalTeamScore += score;
    }

     function endMatch() public onlyOwner matchInProgress {
      assert(contractBalance >= totalTeamScore);
      matchEnded = true;
      payable(owner).transfer(totalTeamScore);
  }


    function resetMatch() public onlyOwner {
        require(matchEnded, "Cannot reset the match while it's in progress.");

        for (uint256 i = 0; i < players.length; i++) {
            playerScores[players[i]] = 0;
        }
        totalTeamScore = 0;
        matchEnded = false;
    }

    function withdrawFunds() public {
        require(matchEnded, "Cannot withdraw funds until the match has ended.");
        require(playerScores[msg.sender] > 0, "You are not a registered player or your score is zero.");
        uint256 playerScore = playerScores[msg.sender];
        playerScores[msg.sender] = 0;
        (bool success, ) = msg.sender.call{value: playerScore}("");
        require(success, "Failed to withdraw funds.");
    }

    function cancelMatch() public view onlyOwner matchInProgress {
        revert("The match has been canceled by the owner.");
    }

    // Function to deposit funds to the contract
    function depositFunds() public payable {
        contractBalance += msg.value;
    }
}
