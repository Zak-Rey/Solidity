// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract Coin {
    address public minter;
     mapping(address => uint) public balances;

    event Sent(address from, address to, uint amount);

    constructor() {
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }

    error insufficientBalance (uint requested, uint available);

    //Sends an amount of existing coins from any caller to an address
    function send(address receiver, uint amount) public{
        if(amount > balances[msg.sender])
            revert insufficientBalance({
                requested: amount,
                available: balances[msg.sender]
            });
        
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}