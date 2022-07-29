

func runningSum(_ nums: [Int]) -> [Int] {
    /// Constraints:
    /// 1 <= nums.length <= 1000
    /// -10^6 <= nums[i] <= 10^6
    guard nums.count >= 1 && nums.count <= 1000 else {
        return []
    }
    guard nums.map({ $0 >= -1_000_000 && $0 <= 1_000_000 }).count == nums.count else {
        return []
    }
    
    // Save the calculated total value
    var resultList: [Int] = []
    // Used to save the calculate value
    var calculateList: [Int] = []
    // The begin index
    var index = 0
    
    while index < nums.count {
        // Save the calculate elements
        calculateList.append(nums[index])
        
        // Calculate the total value of calculateList elements using reduce() then add to resultList
        resultList.append(calculateList.reduce(0, { $0+$1 }))
        
        // Increment index to iterate resultList
        index = index + 1
    }
    return resultList
}


let nums1 = [1,2,3,4] //Output: [1,3,6,10]
let nums2 = [1,1,1,1,1] //Output: [1,2,3,4,5]
let nums3 = [3,1,2,10,1] //Output: [3,4,6,16,17]

let result1 = runningSum(nums1)
let result2 = runningSum(nums2)
let result3 = runningSum(nums3)

