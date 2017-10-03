//Solution goes in Sources

import Foundation

extension String {
    func isEmptyOfWord() -> Bool {
        return isEmpty || (filter { return $0 != " " }).isEmpty
    }
    
    func hasQuestionMarkAtTheEnd() -> Bool {
        return self.last == "?"
    }
    
    func isAllUpperCased() -> Bool {
        return self.uppercased() == self
    }
    
    func hasLetter() -> Bool {
        let pattern = "\\p{letter}"
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        let matches = regex.matches(in: self, options: [], range: NSRange(location: 0, length: self.count))
        return matches.isEmpty.NOT
    }
}

extension Bool {
    var NOT: Bool {
        return !self
    }
}

struct Bob {
    static func hey(_ input: String) -> String {
        switch input {
        case let string where string.isEmptyOfWord():
            return "Fine. Be that way!"
        case let string where string.isAllUpperCased() && string.hasLetter():
            return "Whoa, chill out!"
        case let string where string.hasQuestionMarkAtTheEnd():
            return "Sure."
        default:
            return "Whatever."
        }
    }
}
