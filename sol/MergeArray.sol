// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract MergeArray {
    
    function mergeSortedArrays(
        uint256[] memory arr1,
        uint256[] memory arr2
    ) public pure returns (uint256[] memory) {
        // 获取数组长度
        uint256 len1 = arr1.length;
        uint256 len2 = arr2.length;
        uint256 totalLen = len1 + len2;
        
        // 创建结果数组
        uint256[] memory result = new uint256[](totalLen);
        
        // 初始化指针
        uint256 i = 0; // arr1 指针
        uint256 j = 0; // arr2 指针
        uint256 k = 0; // result 指针
        
        // 合并两个数组
        while (i < len1 && j < len2) {
            if (arr1[i] <= arr2[j]) {
                result[k] = arr1[i];
                i++;
            } else {
                result[k] = arr2[j];
                j++;
            }
            k++;
        }
        
        // 添加剩余元素（如果有）
        while (i < len1) {
            result[k] = arr1[i];
            i++;
            k++;
        }
        
        while (j < len2) {
            result[k] = arr2[j];
            j++;
            k++;
        }
        
        return result;
    }


}

