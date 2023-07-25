// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CricketMatch {
    address public owner;
    mapping(address => uint256) public playerScores;
    uint256 public totalTeamScore;
    bool public matchEnded;
    address[] public players;

    constructor() {
        owner = msg.sender;
        matchEnded = false;
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
        players.push(msg.sender);
    }

    function submitScore(uint256 score) public matchInProgress {
        require(score >= 0 && score <= 100, "Invalid score. It should be between 0 and 100.");
        require(playerScores[msg.sender] + score <= 100, "Player cannot exceed 100 runs.");
        playerScores[msg.sender] += score;
        totalTeamScore += score;
    }

    function endMatch() public onlyOwner matchInProgress {
        assert(address(this).balance >= totalTeamScore, "Insufficient balance to distribute rewards.");
        matchEnded = true;
        payable(owner).transfer(totalTeamScore);
    }

    function resetMatch() public onlyOwner {
        if (!matchEnded) {
            revert("Cannot reset the match while it's in progress.");
        }

        // Reset the match scores
        for (uint256 i = 0; i < players.length; i++) {
            playerScores[players[i]] = 0;
        }
        totalTeamScore = 0;
        matchEnded = false;
    }
}
