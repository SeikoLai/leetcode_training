import Foundation

class Solution {
    func intToRoman(_ num: Int) -> String {
        var result = ""
        let numArray = Array(String(num).compactMap { Int(String($0)) } )
        
        var count = numArray.count
        while count > 0  {
            let index = numArray.count-count
            switch count {
            case 4:
                let thousands = numArray[index]
                result += getThousandsRoman(thousands)
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
        while index > 0 {
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

let solution = Solution()

// Input: num = 3749
// Output: "MMMDCCXLIX"
var testCase = 3749
var result = solution.intToRoman(testCase)

// Input: num = 58
// Output: "LVIII"
testCase = 58
result = solution.intToRoman(testCase)

// Input: num = 1994
// Output: "MCMXCIV"
testCase = 1994
result = solution.intToRoman(testCase)
