// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract Coin {
    //The keyword "public" make the variable accessible from other variables
    address public minter;
     mapping(address => uint) public balances;

    event Sent(address from, address to, uint amount);

    //Constructor code is only run when the contract is created
    constructor() {
        minter = msg.sender;
    }

    //Sends an amount of newly created coins to an address, it can only be called by the contract creator
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }

    //allows you to provide information about why an operation failed, errors are returned to the caller of the function.git 
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