public extension Character {
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
        let ceasrOffSet = Character.alphabet.firstIndex(of: shiftKey)!
        var index = 0
        if decode {
            index = abs((Character.alphabet.firstIndex(of: self)! - ceasrOffSet))
        } else {
            index = (Character.alphabet.firstIndex(of: self)! + ceasrOffSet) % 26
        }
        return Character.alphabet[index]
    }
}

struct Cipher {
    public var key: String
    
    init() {
        var randomKey: [Character] = []
        for _ in 0..<100 {
            randomKey.append(Character.alphabet[(0...25).randomElement()!])
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
        return String(zip(input[..<end], key).map { $0.0.ceasar(shiftKey: $0.1)! })
    }
    
    public func decode(_ input: String) -> String {
        let startKey = key.startIndex
        let end = key.index(startKey, offsetBy: input.count)
        return String(zip(input[..<end], key).map {
            $0.0.ceasar(shiftKey: $0.1, decode: true)!
        })
    }
}

