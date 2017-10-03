//Solution goes in Sources

import Foundation

extension String {
    var isEmptyOfWord: Bool {
        return isEmpty || (filter { return $0 != " " }).isEmpty
    }
    
    var hasQuestionMarkAtTheEnd: Bool {
        return self.hasSuffix("?")
    }
    
    var isAllUpperCased: Bool {
        return self.uppercased() == self
    }
    
    var hasLetter: Bool {
        return (self.rangeOfCharacter(from: .letters)) != nil
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
        case let string where string.isEmptyOfWord:
            return "Fine. Be that way!"
        case let string where string.isAllUpperCased && string.hasLetter:
            return "Whoa, chill out!"
        case let string where string.hasQuestionMarkAtTheEnd:
            return "Sure."
        default:
            return "Whatever."
        }
    }
}
