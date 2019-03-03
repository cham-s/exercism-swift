import Foundation

public extension Character {
    public func convertToRot(_ number: Int) -> Character {
        let alphabet = "abcdefghijklmnopqrstuvwxyz"
        let upperCase = alphabet.uppercased()
        let letters = Array(alphabet)
        let lettersUpper = Array(upperCase)
        guard (alphabet + upperCase).contains(self) else { return self }
        let rightLetters = alphabet.contains(self) ? letters : lettersUpper
        let letterIndex = rightLetters.firstIndex { self == $0 }!
        return rightLetters[(letterIndex + number) % 26]
    }
}
struct RotationalCipher {
    public static func rotate(_ input: String, ROT: Int) -> String {
        return String(input.map { $0.convertToRot(ROT) })
    }
}

