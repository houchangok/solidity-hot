// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
contract Revert {
    
    function revertWithMessage(string memory str) public pure   returns (string memory ){
   
   return reverse(str);

    
}
 
function reverse(string memory _str) public pure returns (string memory) {
    bytes memory strBytes = bytes(_str);
    uint256 len = strBytes.length;
    bytes memory reversed = new bytes(len);
    
    for (uint256 i = 0; i < len; i++) {
        reversed[len - 1 - i] = strBytes[i];
    }
    return string(reversed);5q2
}

}


