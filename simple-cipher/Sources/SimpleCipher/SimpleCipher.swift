
// First draft
//TODO: use dictionary instead of array to sore alphabet
// to make make finding index O(1) instead of O(n)
// among other stuffs

public extension Character {
    public static var alphabetCount: Int { return Character.alphabet.count }
    static var alphabet : [Character] {
        return Array("abcdefghijklmnopqrstuvwxyz")
    }
    public var isAlpha: Bool {
        return Character.alphabet.contains(self) ||
            String(Character.alphabet).uppercased().contains(self)
    }
    public var isLowercase: Bool {
        guard self.isAlpha else { return false }
        return Character.alphabet.contains(self)
    }
    public var isUppercase: Bool {
        return !isLowercase
    }
    
    public func ceasar(shiftKey: Character,
                       decode: Bool = false) -> Character? {
        guard isAlpha else { return nil }
        let keyIndex = Character.alphabet.firstIndex(of: shiftKey)!
        var index = 0
        if decode {
            let selfIndex = Character.alphabet.firstIndex(of: self)!
            index = ((Character.alphabetCount - keyIndex) + selfIndex) % Character.alphabetCount
        } else {
            index = (Character.alphabet.firstIndex(of: self)! + keyIndex) % Character.alphabetCount
        }
        return Character.alphabet[index]
    }
}

struct Cipher {
    public var key: String
    
    init() {
        var randomKey: [Character] = []
        for _ in 0..<100 {
            let index = (0..<Character.alphabetCount).randomElement()!
            let randomLetter = Character.alphabet[index]
            randomKey.append(randomLetter)
        }
        key = String(randomKey)
    }
    
    init?(key: String) {
        guard !key.isEmpty else { return nil }
        guard key.first(where: { $0.isUppercase }) == nil else { return nil }
        guard key.first(where: { !$0.isAlpha }) == nil else { return nil }
        self.key = key
    }
    
    public func encode(_ input: String) -> String {
        let startKey = key.startIndex
        let end = key.index(startKey, offsetBy: input.count)
        return String(zip(input, key[..<end]).map { $0.0.ceasar(shiftKey: $0.1)! })
    }
    
    public func decode(_ input: String) -> String {
        let startKey = key.startIndex
        let end = key.index(startKey, offsetBy: input.count)
        return String(zip(input, key[..<end]).map {
            $0.0.ceasar(shiftKey: $0.1, decode: true)!
        })
    }
}
