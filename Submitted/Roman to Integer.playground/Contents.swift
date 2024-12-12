/// Constraints:
/// 1 <= s.length <= 15
/// s contains only the characters ('I', 'V', 'X', 'L', 'C', 'D', 'M').
/// It is guaranteed that s is a valid roman numeral in the range [1, 3999].

func romanToInt(_ s: String) -> Int {
    guard case let string = s, string.count >= 1 && string.count <= 15 && string.contains(where: { char in
        char == "I" || char == "V" || char == "X" || char == "L" || char == "C" || char == "D" || char == "M"
    }) else {
        return 0
    }
    var number = 0
    var index = 0
    while index < string.count {
        var shift = 1
        let char = string[string.index(string.startIndex, offsetBy: index)]
        let next: Character? = index+1 < string.count ? string[string.index(string.startIndex, offsetBy: index+1)] : nil
        switch char {
        case "I":
            if next == "V" {
                number = number + 4
                shift = 2
            }
            else if next == "X" {
                number = number + 9
                shift = 2
            }
            else {
                number = number + 1
            }
            break
        case "V":
            number = number + 5
            break
        case "X":
            if next == "L" {
                number = number + 40
                shift = 2
            }
            else if next == "C" {
                number = number + 90
                shift = 2
            }
            else {
                number = number + 10
            }
            break
        case "L":
            number = number + 50
            break
        case "C":
            if next == "D" {
                number = number + 400
                shift = 2
            }
            else if next == "M" {
                number = number + 900
                shift = 2
            }
            else {
                number = number + 100
            }
            break
        case "D":
            number = number + 500
            break
        case "M":
            number = number + 1000
            break
        default:
            break
        }
        index = index + shift
    }
    return number
}

/// Input: s = "III"
/// Output: 3
/// Explanation: III = 3.
let s1 = "III" // Output: 3

/// Input: s = "LVIII"
/// Output: 58
/// Explanation: L = 50, V= 5, III = 3.
let s2 = "LVIII" // Output: 58

/// Input: s = "MCMXCIV"
/// Output: 1994
/// Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
let s3 = "MCMXCIV" // Output: 1994

let result1 = romanToInt(s1)
let result2 = romanToInt(s2)
let result3 = romanToInt(s3)
