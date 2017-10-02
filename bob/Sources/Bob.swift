//Solution goes in Sources

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
}

struct Bob {
    static func hey(_ input: String) -> String {
        switch input {
        case let string where string.isEmptyOfWord():
            return "Fine. Be that way!"
        case let string where string.isAllUpperCased():
            return "Whoa, chill out!"
        case let string where string.hasQuestionMarkAtTheEnd():
            return "Sure."
        default:
            return "Whatever."
        }
    }
}
