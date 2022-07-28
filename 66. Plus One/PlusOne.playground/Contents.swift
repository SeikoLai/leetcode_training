func plusOne(_ digits: [Int]) -> [Int] {
    // Constraints:
    //
    // 1 <= digits.length <= 100
    // 0 <= digits[i] <= 9
    // digits does not contain any leading 0's.
    guard 1 <= digits.count && digits.count <= 100 && digits.map({ 0 <= $0 && $0 <= 9}).count == digits.count else {
        return [0]
    }
    var digits = digits
    var index = digits.count - 1
    
    while index >= 0 {
        if digits[index] < 9 {
            digits[index] += 1
            return digits
        }
        digits[index] = 0
        index -= 1
    }
    digits.insert(1, at: 0)
    return digits
}

let digits1 = [1,2,3] // Output: [1,2,4]
let digits2 = [4,3,2,1] // Output: [4,3,2,2]
let digits3 = [9] // Output: [1,0]
let digits4 = [7,2,8,5,0,9,1,2,9,5,3,6,6,7,3,2,8,4,3,7,9,5,7,7,4,7,4,9,4,7,0,1,1,1,7,4,0,0,6]

let result1 = plusOne(digits1) // [1,2,4]
let result2 = plusOne(digits2) // [4,3,2,2]
let result3 = plusOne(digits3) // [1,0]
let result4 = plusOne(digits4)
