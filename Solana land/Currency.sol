//SPDX-License-Identifier : MIT
pragma solidity ^0.8.4;

contract Coin {
    address public minter;
    mapping(address  => uint) public balances;

    event Sent(address from, address to, uint amount);

    constructor() {
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }

    
}