# CricketMatch
The "CricketMatch" contract is a Solidity smart contract for organizing a cricket match on the Ethereum blockchain. It allows players to register for the match, submit their scores, and receive rewards based on their performance.

## Description

The "CricketMatch" contract is a Solidity smart contract for organizing a cricket match on the Ethereum blockchain. It allows players to register for the match, submit their scores, and receive rewards based on their performance.

## Features

- Players can register for the match using the `registerPlayer()` function.
- Players can submit their scores using the `submitScore(uint256 score)` function.
- The contract owner can end the match using the `endMatch()` function and distribute rewards based on player scores.
- The owner can reset the match using the `resetMatch()` function to start a new match.
- Players can withdraw their rewards using the `withdrawFunds()` function after the match has ended.
- The owner can cancel the match using the `cancelMatch()` function if needed.
- Players can deposit funds (Ether) to the contract using the `depositFunds()` function.

## Getting Started

To deploy and interact with the "CricketMatch" contract, you can use Remix, an online Solidity IDE. Follow the steps below:

1. Go to the Remix website at https://remix.ethereum.org/.
2. Create a new file and save it with a .sol extension (e.g., CricketMatch.sol).
3. Copy and paste the provided Solidity code into the file.
4. Click on the "Solidity Compiler" tab, set the compiler version to "0.8.0," and then click "Compile."
5. Go to the "Deploy & Run Transactions" tab, select "CricketMatch" from the dropdown, and click "Deploy."

## Usage

1. Deploy the contract using the steps mentioned in the "Getting Started" section.
2. After deployment, you can interact with the contract as follows:
   - Players can register for the match using the `registerPlayer()` function.
   - Players can submit their scores using the `submitScore(uint256 score)` function.
   - The contract owner can end the match and distribute rewards using the `endMatch()` function.
   - The owner can reset the match using the `resetMatch()` function.
   - Players can withdraw their rewards using the `withdrawFunds()` function.
   - The owner can cancel the match using the `cancelMatch()` function.

## Authors

- Nikhil Sharma
- nikhhils07@gmail.com
