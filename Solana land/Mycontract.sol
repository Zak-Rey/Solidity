
pragma solidity ^0.8.19;

contract SimpleStorage {
    uint256 private _value;

    function getValue() public view returns (uint256) {
        return _value;
    }

    function setValue(uint256 value) public {
        _value = value;
    }
}