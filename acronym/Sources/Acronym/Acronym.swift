import Foundation

struct Acronym {
    static func abbreviate(_ input: String) -> String {
        guard input.isEmpty == false else { return "" }
        let nonLetterSet = CharacterSet(
            charactersIn: "abcdefghijklmnopqrstuvwxyz").inverted
        return String(input.lowercased()
            .components(separatedBy: nonLetterSet)
            .filter { !$0.isEmpty }
            .map { $0.first! }).uppercased()
    }
}
