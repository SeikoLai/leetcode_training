import Foundation

class Solution {
    func isHappy(_ n: Int) -> Bool {
        guard n > 3 else { return false }

        var value = calculate(n)
        if value > 4 {
            value = calculate(value)
        }

        return value == 1
    }

    private func calculate(_ n: Int) -> Int {
        let stringValue = String(n)
        let digits = stringValue.map { Int(String($0)) }
        let sum = digits.reduce(0, { $0 + ($1 ?? 0) * ($1 ?? 0)})
        return sum
    }
}

let solution = Solution()
print(solution.isHappy(19))
