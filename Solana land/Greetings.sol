// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

contract Greetings {
    string public  name;
    string public greetingsPrefix = "Hello  ";

    constructor (string memory initialName){
        name = initialName;
    }

    function setName(string memory newName) public {
        name = newName;
    }

    function getGreetings() public view returns (string memory){
        return string(abi.encodePacked(greetingsPrefix, name));
    }
}