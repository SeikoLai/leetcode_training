/// Constraints:
/// 1 <= ransomNote.length, magazine.length <= 105
/// ransomNote and magazine consist of lowercase English letters.


func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    guard ransomNote.count >= 1 && ransomNote.count <= 100_000 && magazine.count >= 1 && magazine.count <= 100_000 && ransomNote == ransomNote.lowercased() && magazine == magazine.lowercased()else {
        return false
    }
    var constructedLetters = magazine
    var index = 0
    var isContains = false
    while index < ransomNote.count {
        let stringIndex = ransomNote.index(ransomNote.startIndex, offsetBy: index)
        let char = ransomNote[stringIndex]
        if let matchIndex = constructedLetters.firstIndex(of: char) {
            isContains = true
            constructedLetters.remove(at: matchIndex)
        }
        else {
            isContains = false
            break
        }
        index = index + 1
    }
    return isContains
}

func canConstruct2(_ ransomNote: String, _ magazine: String) -> Bool {
    guard ransomNote.count >= 1 && ransomNote.count <= 100_000 && magazine.count >= 1 && magazine.count <= 100_000 && ransomNote == ransomNote.lowercased() && magazine == magazine.lowercased() else {
        return false
    }
    var constructedLetters = magazine
    for char in ransomNote {
        if let matchIndex = constructedLetters.firstIndex(of: char) {
            constructedLetters.remove(at: matchIndex)
        }
        else {
            return false
        }
    }
    return true
}

let ransomNote1 = "a", magazine1 = "b" // Output: false
let ransomNote2 = "aa", magazine2 = "ab" // Output: false
let ransomNote3 = "aa", magazine3 = "aab" // Output: true
let ransomNote4 = "fffbfg", magazine4 = "effjfggbffjdgbjjhhdegh" // Output: true
let ransomNote5 = "fihjjjjei", magazine5 = "hjibagacbhadfaefdjaeaebgi"

//let result1 = canConstruct(ransomNote1, magazine1)
//let result2 = canConstruct(ransomNote2, magazine2)
//let result3 = canConstruct(ransomNote3, magazine3)
//let result4 = canConstruct(ransomNote4, magazine4)
let result5 = canConstruct(ransomNote5, magazine5)
let result6 = canConstruct2(ransomNote5, magazine5)
