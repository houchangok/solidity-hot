// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Roman{

function toRoman(uint256 num) public pure returns (string memory) {
        require(num >= 1 && num <= 3999, "Number out of range (1-3999)");
        
        // 定义罗马数字组件
        string[10][4] memory thousands = [["", "M", "MM", "MMM", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""],["", "", "", "", "", "", "", "", "", ""],["", "", "", "", "", "", "", "", "", ""]];
        string[10][3] memory hundreds = [["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"], ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"], ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]];
        
        uint256[] memory digits = new uint256[](4);
        uint256 temp = num;
        
        for (uint256 i = 0; i < 4; i++) {
            digits[3 - i] = temp % 10;
            temp /= 10;
        }
        
        // 构建罗马数字
        bytes memory roman;
        
        // 处理千位
        if (digits[0] > 0) {
            bytes memory thousandSymbol = bytes(thousands[0][digits[0]]);
            roman = abi.encodePacked(roman, thousandSymbol);
        }
        
        // 处理百位、十位、个位
        for (uint256 i = 1; i < 4; i++) {
            bytes memory symbol = bytes(hundreds[i - 1][digits[i]]);
            roman = abi.encodePacked(roman, symbol);
        }
        
        return string(roman);
    }


    
}