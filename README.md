CricketMatch Smart Contract

The CricketMatch smart contract is a simple Ethereum smart contract that allows players to participate in a virtual cricket match. Players can submit their scores, and the contract keeps track of the total team score. The contract owner can end the match and distribute rewards to the players based on their scores.

Contract Details
Contract Address
The deployed contract address on the Ethereum blockchain is: [Contract Address]

Contract Owner
The owner of the contract is the address that deployed the contract.

Players
Players can register themselves in the match by calling the registerPlayer function. Once registered, a player cannot register again for the same match.

Scoring
Players can submit their scores using the submitScore function. The score should be between 0 and 100. A player's total score cannot exceed 100 runs.

Match Progress
The contract has a matchInProgress modifier, which ensures that the match has not ended before players can submit scores or register. The contract owner can end the match by calling the endMatch function.

Reward Distribution
After the match ends, the contract owner can distribute the rewards among the players based on their scores. Rewards are transferred to the owner of the contract.

Functions
registerPlayer()
Allows players to register themselves in the match. Players can only register before the match has ended, and a player can register only once.

submitScore(uint256 score)
Allows players to submit their scores. The score should be between 0 and 100, and a player's total score cannot exceed 100 runs. Only allowed during a match in progress.

endMatch()
Allows the contract owner to end the match. After calling this function, players cannot submit scores or register for the same match. The contract owner receives the total team score as rewards.

resetMatch()
Allows the contract owner to reset the match scores after the match has ended. This function can be used to prepare the contract for the next match.

Modifiers
onlyOwner()
A modifier that restricts access to certain functions to the contract owner only.

matchInProgress()
A modifier that allows functions to be executed only if the match is in progress (not ended).
