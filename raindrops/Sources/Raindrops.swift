//Solution goes in Sources

extension Int {
    var raindDrops: String {
        var message = ""
        if self % 3 == 0 {
            message += "Pling"
        }
        if self % 5 == 0 {
            message += "Plang"
        }
        if self % 7 == 0 {
            message += "Plong"
        }
        if message.isEmpty {
            message = String(self)
        }
        return message
    }
}

struct Raindrops {
    let value: Int
    var sounds: String {
        return value.raindDrops
    }
    
    init(_ value: Int) {
        self.value = value
    }
}
