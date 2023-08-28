// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Is used to increase the security of the funds stored in the wallet by requiring multiple parties to sign off before sending any transactions
// Importing IERC20 contract from open zeppelin library
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract DEX{
    address public token1; // Address of Token 1
    address public token2; // Address of Token 2
    address public owner;

    // Creating an event to notify/log when ever the function is called

    event Swap(address indexed user, uint256 amountIn, uint256 amountOut, address indexed tokenIn, address indexed tokenOut);

    // Setting a constructor fuction 
    constructor (address _token1, address _token2) { 
        token1 = _token1;
        token2 = _token2;
        owner = msg.sender;
    }
    // Creating Function swap
    function swap(uint256 amountIn, uint256 amountOut, address  tokenIn, address tokenOut) external {
        require(tokenIn == token1 || tokenIn == token2, "INVALID !! TRY AGAIN");
        require(tokenOut == token1 || tokenOut == token2, "INVALID !! TRY AGAIN");
        require(amountIn > 0, "AmountIn must be greater than 0, Try Again");
        require(amountOut > 0, "AmountOut must be greater than 0, Try Again");
        require(IERC20(tokenIn).transferFrom(msg.sender, address(this), amountIn), "TransferIn failed");
        uint256 amountToSend = (amountIn * 1e18) / amountOut; // Assuming a fixed ratio, adjust as needed
        require(IERC20(tokenOut).transfer(msg.sender, amountToSend), "TransferOut failed");
        emit Swap(msg.sender, amountIn, amountToSend, tokenIn, tokenOut);
    }
}