import Foundation

/// Given a non-negative integer x, compute and return the square root of x.
/// Since the return type is an integer, the decimal digits are truncated, and only the integer part of the result is returned.
/// Note: You are not allowed to use any built-in exponent function or operator, such as pow(x, 0.5) or x ** 0.5.
func mySqrt(_ x: Int) -> Int {
    
    let x = Double(x)
    var result = 0.0
    while result < x {
        if result * result == x {
            break
        }
        else if result * result < x {
            result += 0.5
        }
        else {
            result -= 0.5
            break
        }
    }
    return Int(result)
}

func mySqrt2(_ x: Int) -> Int {
    return Int(sqrt(Double(x)))
}

let x0 = 2
let x1 = 4 // Output: 2
let x2 = 8 // Output: 2 Explanation: The square root of 8 is 2.82842..., and since the decimal part is truncated, 2 is returned.
let x3 = 16
let x4 = 20
let x5 = 24
let x6 = 612222220

let result0 = mySqrt2(x0)
let assert0 = sqrt(Double(x0))
let result1 = mySqrt2(x1) // 2
let result2 = mySqrt2(x2) // 2
let assert2 = sqrt(Double(x2))
let result3 = mySqrt2(x3)
let assert3 = sqrt(Double(x3))
let result4 = mySqrt2(x4)
let result5 = mySqrt2(x5)
let assert5 = sqrt(Double(x5))
let result6 = mySqrt2(x6)
let assert6 = sqrt(Double(x6))

