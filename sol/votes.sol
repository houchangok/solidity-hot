// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
contract  Votes {

 // 存储候选人得票数的映射
    mapping(bytes32 => uint256) private votesReceived;
    
    // 存储所有候选人的列表（用于重置功能）
    bytes32[] private candidateList;
    
    // 记录候选人是否已存在的映射
    mapping(bytes32 => bool) private candidateExists;
    
    // 投票事件
    event Voted(address indexed voter, string candidate);

    // 投票函数
    function vote(string memory candidate) public {
        bytes32 candidateHash = keccak256(abi.encodePacked(candidate));
        
        // 如果是新候选人，添加到列表
        if (!candidateExists[candidateHash]) {
            candidateList.push(candidateHash);
            candidateExists[candidateHash] = true;
        }
        
        votesReceived[candidateHash]++;
        
        emit Voted(msg.sender, candidate);
    }

    // 获取候选人得票数
    function getVotes(string memory candidate) public view returns (uint256) {
        bytes32 candidateHash = keccak256(abi.encodePacked(candidate));
        return votesReceived[candidateHash];
    }

    // 重置所有候选人得票数
    function resetVotes() public {
        for (uint i = 0; i < candidateList.length; i++) {
            votesReceived[candidateList[i]] = 0;
        }
    }

}