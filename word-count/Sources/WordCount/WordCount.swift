import Foundation

struct WordCount {
    private var wordCount: [String: Int] = [:]
    
    init(words: String) {
        populateWordCount(str: words)
    }
    
    func count() -> [String: Int] {
        return wordCount
    }
    
    private mutating func populateWordCount(str: String) {
        guard str.isEmpty == false else { return }
        
        let separator = CharacterSet.alphanumerics.inverted
        let components = str.components(separatedBy: separator)
            .filter { !$0.isEmpty }.map { $0.lowercased() }
        components.forEach { wordCount[$0, default: 0] += 1 }
    }
}

