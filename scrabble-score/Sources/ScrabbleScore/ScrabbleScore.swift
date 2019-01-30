//Solution goes in Sources
import Foundation

struct Scrabble {
    var word: String? = ""

    var score: Int {
        return Scrabble.computeScore(withWord: word)
    }
    
    init(_ word: String?) {
        self.word = word
    }
    
    static func score(_ word: String?) -> Int {
        return Scrabble.computeScore(withWord: word)
    }
    
    private static func computeScore(withWord: String?) -> Int {
        guard let word = withWord else { return 0 }
        let uppercased = word.uppercased()
        return uppercased.reduce(0) {$0 + pointFor($1)}
    }
    
    private static func pointFor(_ letter: Character) -> Int {
        switch letter {
        case "A", "E", "I", "O", "U", "L", "N", "R", "S", "T":
            return 1
        case "D", "G":
            return 2
        case "B", "C", "M", "P":
            return 3
        case "F", "H", "V", "W", "Y":
            return 4
        case "K":
            return 5
        case "J", "X":
            return 8
        case "Q", "Z":
            return 10
        default:
            return 0
        }
    }
}
