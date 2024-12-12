// https://leetcode.com/problems/contains-duplicate/
// Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var numbers = nums
        var target = numbers.removeFirst()
        while numbers.count > 0 {
            if numbers.contains(target) {
                return true
            }
            target = numbers.removeFirst()
        }
        return false
    }
    func containsDuplicate2(_ nums: [Int]) -> Bool {
        return Set(nums).count != nums.count
    }
    func containsDuplicate3(_ nums: [Int]) -> Bool {
        var hashMap: [Int:Int] = [:]
        for element in nums {
            if let _ = hashMap[element] {
                return true
            } else {
                hashMap[element] = 0
            }
        }
        return false
    }
    func containsDuplicate4(_ nums: [Int]) -> Bool {
        var hashTable = [Int: Bool]()
        for number in nums {
            if hashTable[number] != nil {
                return true
            }
            else {
                hashTable[number] = true
            }
        }
        return false
    }
}

var result = Solution().containsDuplicate4([1,1,1,3,3,4,3,2,4,2])
result = Solution().containsDuplicate4([1,2,3,4])
