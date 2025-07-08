// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract BinarySearch {

    function find(uint256[] memory arr, uint256 key) public pure  returns (uint256) {
        uint256 start = 0; uint256 end = arr.length-1;
        while (start <=end) { 
            uint256 mid = start+(end - start) / 2; 
            if(arr[mid] == key){
                return key;   }

            else if (arr[mid] > key){
              end = mid-1; 
            }
            else if (arr[mid] < key) {
                start = mid + 1;
        }
        }
        return uint256(0);        
}


}
