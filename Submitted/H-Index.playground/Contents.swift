class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        let sortedCitations = citations.sorted(by: >)
        var hIndex = 0
        for (index, citation) in sortedCitations.enumerated() {
            let reference = index+1
            if citation >= reference {
                hIndex = reference
            }
        }
        return hIndex
    }
}

let solution = Solution()
var citations = [3,0,6,1,5]
var result = solution.hIndex( citations )
print( result )

citations = [1,3,1]
result = solution.hIndex( citations )
print( result )

