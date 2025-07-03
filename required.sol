// SPDX-License-Identifier: UNLICENSED
pragma solidity >= 0.7.0 <0.9.0;

contract Required {
    mapping(address => uint) balances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint amount) public {
        uint balance = balances[msg.sender];
        require(balance >= amount, "balance is not sufficient");
        balances[msg.sender] -= amount; 
        (bool sent, ) = payable(msg.sender).call{value: amount}("");
        require(sent, "failed to send Ether");
    }
}