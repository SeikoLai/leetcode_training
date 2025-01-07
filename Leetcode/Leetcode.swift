//
//  Leetcode.swift
//  Leetcode
//
//  Created by Sam on 2024/12/12.
//

import Foundation

// Given an integer num, repeatedly add all its digits until the result has only one digit, and return it.
//
// Example 1:
// Input: num = 38
// Output: 2
// Explanation: The process is
// 38 --> 3 + 8 --> 11
// 11 --> 1 + 1 --> 2
// Since 2 has only one digit, return it.
//
// Example 2:
// Input: num = 0
// Output: 0

class Solution {
    func addDigits(_ num: Int) -> Int {
        var value = num
        
        while value > 9 {
            value = Array(String(value)).reduce(into: 0) { partialResult, char in
                if let number = Int(String(char)) {
                    partialResult += number
                }
            }
        }
        
        return value
    }
}
