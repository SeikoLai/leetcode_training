/// Given an integer num, return the number of steps to reduce it to zero.
/// In one step, if the current number is even, you have to divide it by 2, otherwise, you have to subtract 1 from it.
func numberOfSteps(_ num: Int) -> Int {
    /// Constraints:
    /// 0 <= num <= 10^6
    guard num >= 0 && num <= 1_000_000 else {
        return 0
    }
    var steps = 0
    var number = num
    while number > 0 {
        number = number % 2 == 0 ? number / 2 : number - 1
        steps = steps + 1
    }
    return steps
}

/// Input: num = 14
/// Output: 6
/// Explanation:
/// Step 1) 14 is even; divide by 2 and obtain 7.
/// Step 2) 7 is odd; subtract 1 and obtain 6.
/// Step 3) 6 is even; divide by 2 and obtain 3.
/// Step 4) 3 is odd; subtract 1 and obtain 2.
/// Step 5) 2 is even; divide by 2 and obtain 1.
/// Step 6) 1 is odd; subtract 1 and obtain 0.
let num1 = 14 // Output: 6

/// Input: num = 8
/// Output: 4
/// Explanation:
/// Step 1) 8 is even; divide by 2 and obtain 4.
/// Step 2) 4 is even; divide by 2 and obtain 2.
/// Step 3) 2 is even; divide by 2 and obtain 1.
/// Step 4) 1 is odd; subtract 1 and obtain 0.
let num2 = 8 // Output: 4

let num3 = 123 // Output: 12

let result1 = numberOfSteps(num1)
let result2 = numberOfSteps(num2)
let result3 = numberOfSteps(num3)
