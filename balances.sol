// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Balances {
    mapping(address => uint) balances;

    receive() external payable {
        balances[msg.sender] += msg.value;
    }

    fallback() external payable {
        balances[msg.sender] += msg.value;
    }

    function getAmountSent(address addr) public view returns (uint) {
        return balances[addr];
    }
}
