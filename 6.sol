// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleVoting {
    address public owner;
    string public candidate;
    uint256 public voteCount;

    event VoteCast(address indexed voter);

    constructor(string memory _candidate) {
        owner = msg.sender;
        candidate = _candidate;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "ACCESS RESTRICTED, ONLY FOR OWNER");
        _;
    }

    modifier hasNotVoted() {
        require(voteCount == 0, "ALREADY VOTED");
        _;
    }

    function vote() external onlyOwner hasNotVoted {
        voteCount++;
        emit VoteCast(msg.sender);
    }

    function getVoteCount() external view returns (uint256) {
        return voteCount;
    }
}
