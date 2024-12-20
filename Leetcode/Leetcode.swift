//
//  Leetcode.swift
//  Leetcode
//
//  Created by Sam on 2024/12/12.
//

import Foundation

// Example 1:
// Input: n = 19
// Output: true
// Explanation:
// 12 + 92 = 82
// 82 + 22 = 68
// 62 + 82 = 100
// 12 + 02 + 02 = 1
//
// Example 2:
// Input: n = 2
// Output: false

class Solution {
    func isHappy(_ n: Int) -> Bool {
        
        let dict = Dictionary(
            uniqueKeysWithValues: Array(arrayLiteral: String(n)).enumerated().map { ($0,  pow((Double($1) ?? 0.0), 2.0))
            })
        
    }
}
