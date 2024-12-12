import Foundation

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var modifiedDigits = digits
        var index = digits.count - 1
        var carry = 0
        while index >= 0 {
            let digitString = String(digits[index]+(carry > 0 ? 0: 1)+carry)
            if digitString.count == 1 {
                modifiedDigits[index] = Int(digitString)!
                carry = 0
                break
            } else {
                if let first = digitString.first,
                   let last = digitString.last {
                    carry = Int(String(first)) ?? 0
                    modifiedDigits[index] = Int(String(last)) ?? 0
                }
            }
            index -= 1
        }
        if carry > 0 {
            modifiedDigits.insert(carry, at: 0)
        }
        return modifiedDigits
    }
}
