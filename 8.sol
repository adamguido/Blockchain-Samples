pragma solidity ^0.8.0;

import "@polygon/contracts/token/ERC20/IERC20.sol";
import "@polygon/contracts/utils/cryptography/ECDSA.sol";

contract ScalingSolution {

    address public immutable maticToken;

    constructor(address _maticToken) {
        maticToken = _maticToken;
    }

    function sendTransaction(address to, uint256 amount) public payable {
        // Transfer funds to the Polygon sidechain
        IERC20(maticToken).transfer(to, amount);
    }

    function withdrawTransaction() public payable {
        // Withdraw funds from the Polygon sidechain
        IERC20(maticToken).transfer(msg.sender, msg.value);
    }
}