//Solution goes in Sources

import Foundation

enum Plant: Character, CaseIterable {
    case radishes = "R"
    case clover = "C"
    case grass = "G"
    case violets = "V"
}

struct Garden {
    static var classChildren = ["Alice", "Bob", "Charlie", "David", "Eve",
                                "Fred", "Ginny", "Harriet", "Ileana", "Joseph",
                                "Kincaid", "Larry"]
    var children: [String] = []
    
    var diagram = ""
    var plantsOwner: [String: [Plant]] = [:]
    
    
    init(_ diagram: String, children: [String] = Garden.classChildren) {
        guard isInputCorrectFor(diagram, children) else { return }
        self.children = children.sorted()
        self.diagram = diagram
        populatePlantsOwner()
    }
    
    // This is a hook since the exercise and tests do not require the init
    // function to be failable the diagram and children are set to empty if
    // the input from the API user is not correct. A better solution would be
    // to notify exercism by submitting a suggestion (or PR) about making the
    // init failable (with Optional or throw).
    private mutating func isInputCorrectFor(_ diagram: String,
                                            _ children: [String]) -> Bool {
        let levels = diagram.components(separatedBy: "\n")
        let validSymbols = String(Plant.allCases.map { $0.rawValue })
        let invalidSet = CharacterSet(charactersIn: validSymbols).inverted
        for level in levels {
            guard level.rangeOfCharacter(from: invalidSet) == nil else {
                return false
            }
        }
        return true
    }
    
    private mutating func reset() {
        self.diagram = ""
        self.children = []
    }
    
    func plantsForChild(_ name: String) -> [Plant] {
        return plantsOwner[name] ?? []
    }
    
    
    /// Populates the plants owner dictionary
    /// It splits the diagram string by two, then for each row it steps
    /// the level two by two and converts each of these two, from a symbol to its
    /// corresponding Plant and append it to the correct name.

    private mutating func populatePlantsOwner() {
        let levels = diagram.components(separatedBy: "\n")
        guard levels.isEmpty == false else { return }
        
        for level in levels {
            var lowerBound = 0
            var index = 0
            let count = level.count + 2
            for upperBound in stride(from: 0, to: count, by: 2) {
                guard upperBound != 0 else { continue }
                let startIndex = level.index(level.startIndex, offsetBy: lowerBound)
                let lastIndex = level.index(level.startIndex, offsetBy: upperBound)
                let plantSymbols = level[startIndex..<lastIndex]
                for symbol in plantSymbols {
                    let name = children[index]
                    if  plantsOwner[name] != nil {
                        plantsOwner[name]!.append(Plant(rawValue: symbol)!)
                    } else {
                        plantsOwner[name] = [Plant(rawValue: symbol)!]
                    }
                }
                lowerBound = upperBound
                index += 1
            }
        }
    }
}

