//Solution goes in Sources

import Foundation

extension String {
    var isLetter: Bool {
        return (self.rangeOfCharacter(from: .letters)) != nil
    }
}

struct Isogram {
    static func isIsogram(_ string: String) -> Bool {
        var visited = ""
        for char in string.lowercased() {
            let currentCharAsString = String(char)
            guard currentCharAsString.isLetter else { continue }
            if visited.contains(char) { return false }
            visited += currentCharAsString
        }
        return true
    }
}
