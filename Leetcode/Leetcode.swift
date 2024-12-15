//
//  Leetcode.swift
//  Leetcode
//
//  Created by Sam on 2024/12/12.
//

import Foundation

// Example 1:
// Input: num = 3749
// Output: "MMMDCCXLIX"
// Explanation:
// 3000 = MMM as 1000 (M) + 1000 (M) + 1000 (M)
//  700 = DCC as 500 (D) + 100 (C) + 100 (C)
//   40 = XL as 10 (X) less of 50 (L)
//    9 = IX as 1 (I) less of 10 (X)
// Note: 49 is not 1 (I) less of 50 (L) because the conversion is based on decimal places

// Example 2:
// Input: num = 58
// Output: "LVIII"
// Explanation:
// 50 = L
//  8 = VIII

// Example 3:
// Input: num = 1994
// Output: "MCMXCIV"
// Explanation:
// 1000 = M
//  900 = CM
//   90 = XC
//    4 = IV

class Solution {
    func intToRoman(_ num: Int) -> String {
        var result = ""
        let numArray = Array(String(num).compactMap { Int(String($0)) } )
        
        var count = numArray.count
        while count > 0  {
            let index = numArray.count-count
            switch count {
            case 4:
                result += getThousandsRoman(numArray[index])
            case 3:
                result += getHundredsRoman(numArray[index])
            case 2:
                result += getTensRoman(numArray[index])
            case 1:
                result += getOnesRoman(numArray[index])
            default: result += ""
            }
            count -= 1
        }
        
        return result
    }
    
    private func getThousandsRoman(_ num: Int) -> String {
        var index = num
        var result = ""
        while index < 0 {
            result += "M"
            index -= 1
        }
        return result
    }
    
    private func getHundredsRoman(_ num: Int) -> String {
        guard num > 0 else { return "" }
        var result = ""
        if num == 9 { return "CM" }
        else if num == 4 { return "CD" }
        else if num == 5 { return "D" }
        else if num > 5 && num < 9 {
            result = "D"
            let times = num % 5
            for _ in 0..<times {
                result += "C"
            }
            return result
        } else {
            for _ in 0..<num {
                result += "C"
            }
            return result
        }
    }
    
    private func getTensRoman(_ num: Int) -> String {
        guard num > 0 else { return "" }
        var result = ""
        if num == 9 { return "XC" }
        else if num == 4 { return "XL" }
        else if num == 5 { return "L" }
        else if num > 5 && num < 9 {
            result = "L"
            let times = num % 5
            for _ in 0..<times {
                result += "X"
            }
            return result
        } else {
            for _ in 0..<num {
                result += "X"
            }
            return result
        }
    }
    
    private func getOnesRoman(_ num: Int) -> String {
        guard num > 0 else { return "" }
        var result = ""
        if num == 9 { return "IX" }
        else if num == 4 { return "IV" }
        else if num == 5 { return "V" }
        else if num > 5 && num < 9 {
            result = "V"
            let times = num % 5
            for _ in 0..<times {
                result += "I"
            }
            return result
        } else {
            for _ in 0..<num {
                result += "I"
            }
            return result
        }
    }
}
