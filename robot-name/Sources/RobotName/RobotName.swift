//Solution goes in Sources
import Foundation

struct Robot {
    var name = ""
    private static var names: Set<String> = Set<String>()
    
    init() {
        name = generateName()
    }
    
    mutating func resetName() {
        Robot.names.remove(name)
        name = generateName()
    }
    
    private func generateName() ->  String {
        let upperAlpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let numbers = "0123456789"
        var name = String(upperAlpha.randomFor(2)) + String(numbers.randomFor(3))
        while Robot.names.contains(name) {
            name =  String(upperAlpha.randomFor(2)) + String(numbers.randomFor(3))
        }
        Robot.names.insert(name)
        return name
    }
}

extension Collection {
    func randomFor(_ amount: Int) -> [Element] {
        guard isEmpty == false else { return [] }
        var elements: [Element] = []
        elements.reserveCapacity(amount)
        for _ in 0..<amount {
            elements.append(randomElement()!)
        }
        return elements
    }
}

