import Foundation

struct IsbnVerifier {
    
    static func isValid(_ input: String) -> Bool {
        
        let stripped = input.filter { $0 != "-" }
        guard stripped.count == 10 else { return false }
        
        let invalidSet = CharacterSet(charactersIn: "0123456789X").inverted
        guard stripped.rangeOfCharacter(from: invalidSet) == nil else { return false }
        
        if let xIndex = stripped.lastIndex(of: "X") {
            guard xIndex == stripped.index(before: stripped.endIndex) else {
                return false
            }
        }
        
        let numbers: [Int] = stripped.map { Int(String($0)) ?? 10 }
        var result = 0
        for (index, value) in (1...10).reversed().enumerated() {
            result += numbers[index] * value
        }
        
        return result % 11 == 0
    }
}

