// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    mapping(uint8 => uint) votes;
    mapping(address => bool) voted;
    uint8 mostVoted = 1;

    function getVotes(uint8 number) public view returns (uint) {
        require((number >= 1 && number <= 5), "number outside voting space");
        return votes[number];
    }

    function vote(uint8 number) public {
        require((voted[msg.sender] == false), "address already voted in this pool");
        voted[msg.sender] = true;
        require((number >= 1 && number <= 5), "number outside voting space");
        votes[number] += 1;
        if (votes[number] >= votes[mostVoted]) {
            mostVoted = number;
        }
    }

    function getCurrentWinner() public view returns (uint8) {
        return mostVoted;
    }
}