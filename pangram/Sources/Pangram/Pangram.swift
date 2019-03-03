import Foundation

struct Pangram {
    static func isPangram(_ input: String) -> Bool {
        let lowered = input.lowercased()
        let letters = "abcdefghijklmnopqrstuvwxyz"
        let separator = CharacterSet(charactersIn: letters).inverted
        let components = lowered.components(separatedBy: separator)
            .filter { !$0.isEmpty }.reduce("", +)
        return Set(components).count == 26
    }
}

