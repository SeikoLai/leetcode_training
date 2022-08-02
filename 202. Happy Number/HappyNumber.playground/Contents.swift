// https://leetcode.com/problems/happy-number/

// Write an algorithm to determine if a number n is happy.
//
// A happy number is a number defined by the following process:
//
// Starting with any positive integer, replace the number by the sum of the squares of its digits.
// Repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1.
// Those numbers for which this process ends in 1 are happy.
// Return true if n is a happy number, and false if not.

class Solution {
    func isHappy(_ n: Int) -> Bool {
        guard 0 < n else {
            return false
        }
        
        var divider = "1"
        
        var count = 0
        var number = String(n)
        var index = 0
        
        var isMatch = false
        while isMatch == false {
            let value = Int(String(number[number.index(number.startIndex, offsetBy: index)]))!
            
            count += value*value
            
            print("index = \(index)")
    
            divider = "\(divider)0"
            
            
            index += 1
            
            if  Int(count)
                    > 4 && Int(count) % Int(divider)! == 1 {
                print("count = \(count)")
                print(divider)
                return true
            }
            else {
                number = String(count)
            }
        }
        
        return false
    }
}


var result = Solution().isHappy(19)
