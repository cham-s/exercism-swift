func &<T: UnsignedInteger>(left: T, right: T) ->  Bool {
    return left & right != 0
}

struct SecretHandshake {
    private let secrets: [(key: UInt16, value: String)] = [
        (key: 1, value: "wink"),
        (key: 2, value: "double blink"),
        (key: 4, value: "close your eyes"),
        (key: 8, value: "jump")
    ]
    private let reversable: UInt16 = 16
    
    var commands: [String] = []
    
    init(_ input: UInt16) {
        commands = secrets.filter { input & $0.key }.map { $0.value }
        if input & reversable { commands.reverse() }
    }
}

