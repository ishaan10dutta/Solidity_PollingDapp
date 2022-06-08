// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract PollDapp{
    string public question;
    string[] public options;

    mapping (uint => uint) public voteCount; //option index->number of votes for that option
    mapping (address => uint) public castedVotes;

    constructor (string memory _question, string[] memory _options){
        question = _question;
        options = _options;
    }

    function getOptions() public view returns (string[] memory){
        return options;
    }

    function castVote(uint _optionIndex) public returns (string memory){
        address _caller = msg.sender;

        uint existingVotes = voteCount[_optionIndex];
        uint updatedVotes = existingVotes + 1;

        uint existingVotesCasted = castedVotes[_caller];

        require(existingVotesCasted == 0, "Error: You can only vote once!");

        uint updatedVotesCasted = existingVotesCasted + 1;

        voteCount[_optionIndex] = updatedVotes;
        castedVotes[_caller] = updatedVotesCasted;

        return "Your vote has been polled successfully!";
    } 
}