#CricketMatch Smart Contract

Simple Overview of Use/Purpose:
The CricketMatch smart contract is designed to facilitate a virtual cricket match on the Ethereum blockchain. Players can register themselves for the match, submit their scores during the match, and at the end of the match, the contract owner can distribute rewards to the players based on their scores.

#Description:
The CricketMatch smart contract allows players to participate in a virtual cricket match by registering themselves and submitting their scores. Players can register only before the match has ended, and each player can register only once. During the match, players can submit their scores, which should be between 0 and 100. The total score of a player cannot exceed 100 runs.

The contract owner, who is the address that deployed the contract, can end the match using the endMatch() function. Once the match is ended, players cannot submit scores or register for the same match. The contract owner then receives the total team score as rewards.

In addition, the contract owner can use the resetMatch() function to reset the match scores after the match has ended, which prepares the contract for the next match.

#Getting Started:
Installing:
To run this contract and test the mechanisms, follow these steps:

Use a Solidity development environment or an online IDE such as Remix.

Create a new Solidity file and save it with a .sol extension (e.g. cricket. sol).

Copy and paste the following code into the file:

#Executing Program:
To interact with the CricketMatch smart contract, users can use Ethereum wallets like MetaMask or other smart contract interaction tools.

To register for the match, call the registerPlayer() function before the match has ended. Only players who have not already registered can do this.

During the match, players can submit their scores by calling the submitScore(uint256 score) function, providing their score as a parameter. Players can submit scores multiple times, but their total score cannot exceed 100 runs.

Once the match is over, the contract owner can call the endMatch() function to finalize the match. After this, players cannot submit scores or register for the same match. The contract owner receives the total team score as rewards.

If needed, the contract owner can use the resetMatch() function to reset the match scores after the match has ended, preparing the contract for the next match.

#Help:
Common problems or issues may include:

Players trying to submit scores after the match has ended.
Players attempting to register multiple times for the same match.
Players submitting scores exceeding the maximum limit of 100 runs.
If any issues arise during the interaction with the contract, users can refer to the contract code for specific rules and constraints.

#Authors:
Nikhil Sharma
nikhhils07@gmail.com


#License:
This project is licensed under the MIT License - see the LICENSE.md file for details
