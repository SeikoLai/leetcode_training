func addBinary(_ a: String, _ b: String) -> String {
    // Constraints:
    //
    // 1 <= a.length, b.length <= 10^4
    // a and b consist only of '0' or '1' characters.
    // Each string does not contain leading zeros except for the zero itself.
    var a = Array(a)
    var b = Array(b)
    var index = max(a.count, b.count) - 1
    var result = a.count >= b.count ? a : b

    while (a.count < result.count) {
        a.insert("0", at: 0)
    }
    
    while (b.count < result.count) {
        b.insert("0", at: 0)
    }
    
    var isCarray = false
    repeat {
        if isCarray {
            if isCarray && a[index] == "0" && b[index] == "0" {
                result[index] = "1"
                isCarray = false
            }
            else if isCarray && a[index] == "0" && b[index] == "1" || a[index] == "1" && b[index] == "0" {
                result[index] = "0"
                isCarray = true
            }
            else if isCarray && a[index] == "1" && b[index] == "1" {
                result[index] = "1"
                isCarray = true
            }
        }
        else if a[index] == "0" && b[index] == "0" {
            result[index] = "0"
            isCarray = false
        }
        else if a[index] == "0" && b[index] == "1" || a[index] == "1" && b[index] == "0" {
            result[index] = "1"
            isCarray = false
        }
        else if a[index] == "1" && b[index] == "1" {
            result[index] = "0"
            isCarray = true
        }
        index -= 1
    } while (index >= 0)
    
    if isCarray {
        result.insert("1", at: 0)
    }
    return result.reduce("") { partialResult, char in
        "\(partialResult)\(char)"
    }
}

let a1 = "11", b1 = "1" // Output: "100"
let a2 = "1010", b2 = "1011" // Output: "10101"
let a3 = "10100000100100110110010000010101111011011001101110111111111101000000101111001110001111100001101",
    b3 = "110101001011101110001111100110001010100001101011101010000011011011001011101111001100000011011110011"
let a4 = "111", b4 = "1101"

let result1 = addBinary(a1, b1) == "100" // "100"
let result2 = addBinary(a2, b2) == "10101" // "10101"
let result3 = addBinary(a3, b3) == "110111101100010011000101110110100000011101000101011001000011011000001100011110011010010011000000000"// "110111101100010011000101110110100000011101000101011001000011011000001100011110011010010011000000000"
let result4 = addBinary(a4, b4) == "10100"
