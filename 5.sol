// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MultiSigWallet{
    address public owner1;
    address public owner2;
    address public owner3;

    uint256 public balance;
    
    constructor(address _owner1,address _owner2,address _owner3){
        owner1 = _owner1;
        owner2 = _owner2;
        owner3 = _owner3;
    }
    // Function to deposit funds
    receive() external payable {
        require(msg.sender == owner1 || msg.sender == owner2 || msg.sender == owner3, "Only owners can deposit");
        balance += msg.value;
    }

    // Function to withdraw funds
    function executeTransaction(address payable to, uint256 value) public {
        require(
            (msg.sender == owner1 && (msg.sender == owner2 || msg.sender == owner3)) ||
            (msg.sender == owner2 && msg.sender == owner3),
            "NOT AUTHORIZED, NEED MORE SIGNATURES"
        );

        require(address(this).balance >= value, "LOW BALANCE");
        to.transfer(value);
    }

}