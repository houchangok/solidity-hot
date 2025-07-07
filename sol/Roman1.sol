// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Roman1 {
    
    // 罗马字符到数值的映射
    function charToValue(bytes1 char) private pure returns (uint256) {
        if (char == 'I') return 1;
        if (char == 'V') return 5;
        if (char == 'X') return 10;
        if (char == 'L') return 50;
        if (char == 'C') return 100;
        if (char == 'D') return 500;
        if (char == 'M') return 1000;
        revert("Invalid Roman character");
    }

    // 主转换函数（优化版）
    function fromRoman(string memory roman) public pure returns (uint256) {
        bytes memory romanBytes = bytes(roman);
        uint256 length = romanBytes.length;
        require(length > 0, "Empty string");
        
        uint256 total = 0;
        uint256 prevValue = 0;
        
        // 从右向左处理更高效
        for (uint256 i = length; i > 0; i--) {
            bytes1 currentChar = romanBytes[i - 1];
            uint256 currentValue = charToValue(currentChar);
            
            // 应用罗马数字规则（小值在大值前表示减法）
            if (currentValue < prevValue) {
                // 验证减法规则是否合法
                require(
                    (currentValue == 1 && (prevValue == 5 || prevValue == 10)) ||
                    (currentValue == 10 && (prevValue == 50 || prevValue == 100)) ||
                    (currentValue == 100 && (prevValue == 500 || prevValue == 1000)),
                    "Invalid subtraction"
                );
                total -= currentValue;
            } else {
                // 验证合法序列（防止如 "IIV" 的无效组合）
                if (prevValue != 0) {
                    require(
                        currentValue >= prevValue || 
                        (prevValue == 1 && currentValue == 1) ||
                        (prevValue == 10 && currentValue == 10) ||
                        (prevValue == 100 && currentValue == 100),
                        "Invalid sequence"
                    );
                }
                total += currentValue;
            }
            
            prevValue = currentValue;
        }
        
        // 验证结果在有效范围内
        require(total >= 1 && total <= 3999, "Out of valid range (1-3999)");
        return total;
    }

}