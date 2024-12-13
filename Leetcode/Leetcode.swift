//
//  Leetcode.swift
//  Leetcode
//
//  Created by Sam on 2024/12/12.
//

import Foundation

class Solution {
    func reverseWords(_ s: String) -> String {
        guard s.count > 1 else { return s }
        
        let trimmedWhitespaceSentence = s.trimmingCharacters(in: .whitespaces)
        let words = trimmedWhitespaceSentence.split(separator: " ")
        let trimmedWhitespaceWords = words.compactMap { $0.trimmingCharacters(in: .whitespaces) }
        return trimmedWhitespaceWords.reversed().joined(separator: " ")
    }
}
