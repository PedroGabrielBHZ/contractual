// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Richest {
    mapping(address => uint) public balances;
    mapping(address => bool) public canWithdraw;
    address public richest;

    constructor() {
        richest = address(0);
        balances[richest] = 0;
    }

    function becomeRichest() public payable returns (bool) {
        if (msg.value > balances[richest]) {
            canWithdraw[richest] = true;
            richest = msg.sender;
            balances[richest] = msg.value;
            return true;
        }
        return false;
    }
}
