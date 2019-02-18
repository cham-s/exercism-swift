struct Anagram {
    
    public var word: String
    
    init(word: String) {
        self.word = word
    }
    
    public func match(_ words: [String]) -> [String] {
        guard words.isEmpty == false else { return [] }
        return words.filter {
            $0.lowercased() != word.lowercased() &&
            $0.lowercased().sorted() == word.lowercased().sorted()
        }
    }
}

