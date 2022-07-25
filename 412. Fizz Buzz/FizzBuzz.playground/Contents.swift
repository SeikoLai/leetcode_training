import UIKit

/// Given an integer n, return a string array answer (1-indexed) where:
/// answer[i] == "FizzBuzz" if i is divisible by 3 and 5.
/// answer[i] == "Fizz" if i is divisible by 3.
/// answer[i] == "Buzz" if i is divisible by 5.
/// answer[i] == i (as a string) if none of the above conditions are true.
///

/// Input: n = 3
/// Output: ["1","2","Fizz"]
let n1 = 3

/// Input: n = 5
/// Output: ["1","2","Fizz","4","Buzz"]
let n2 = 5

/// Input: n = 15
/// Output: ["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz"]
let n3 = 15

func fizzBuzz(_ n: Int) -> [String] {
    /// Constraints:
    /// 1 <= n <= 10^4
    guard n >= 1 && n <= 10_000 else {
        return []
    }
    var strings: [String] = []
    var index = 1
    while index < n+1 {
        var string = ""
        if index % 3 == 0 { string.append("Fizz") }
        if index % 5 == 0 { string.append("Buzz") }
        if string.isEmpty { string.append(String(index)) }
        strings.append(string)
        index = index + 1
    }
    return strings
}

func fizzBuzz2(_ n: Int) -> [String] {
    /// Constraints:
    /// 1 <= n <= 10^4
    guard n >= 1 && n <= 10_000 else {
        return []
    }
    return Array(1...n).map { num in
        var string = ""
        if num % 3 == 0 { string.append("Fizz") }
        if num % 5 == 0 { string.append("Buzz") }
        if string.isEmpty { string.append(String(num)) }
        return string
    }
}

func fizzBuzz3(_ n: Int) -> [String] {
    /// Constraints:
    /// 1 <= n <= 10^4
    guard n >= 1 && n <= 10_000 else {
        return []
    }
    var strings: [String] = []
    for index in 1...Array(1...n).count {
        var string = ""
        if index % 3 == 0 { string.append("Fizz") }
        if index % 5 == 0 { string.append("Buzz") }
        if string.isEmpty { string.append(String(index)) }
        strings.append(string)
    }
    return strings
}

let reslut1 = fizzBuzz(n1)
let reslut2 = fizzBuzz(n2)
let reslut3 = fizzBuzz(n3)

let reslut4 = fizzBuzz2(n1)
let reslut5 = fizzBuzz2(n2)
let reslut6 = fizzBuzz2(n3)

let reslut7 = fizzBuzz3(n1)
let reslut8 = fizzBuzz3(n2)
let reslut9 = fizzBuzz3(n3)

