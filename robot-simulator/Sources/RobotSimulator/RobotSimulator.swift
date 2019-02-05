import Foundation

enum Orientation: Int {
    case north = 1
    case east = 2
    case south = 3
    case west = 4
    
    mutating func turn(_ instruction: Instruction) {
        switch instruction {
        case  .turnLeft :
            let value = self.rawValue - 1 < 1 ? 4 : self.rawValue - 1
            self = Orientation(rawValue: value)!
        case  .turnRight :
            let value = self.rawValue + 1 > 4 ? 1 : self.rawValue + 1
            self = Orientation(rawValue: value)!
        default:
            break
        }
    }
}

enum Instruction: Character {
    case turnRight = "R"
    case turnLeft = "L"
    case advance = "A"
    
    static func instructions(from list: String) -> [Instruction] {
        let validSet = CharacterSet(charactersIn: "LRA")
        guard list.rangeOfCharacter(from: validSet) != nil else { return [] }
        return list.map { Instruction(rawValue: $0)! }
    }
}

struct SimulatedRobot {
    var coordinates: (x: Int, y: Int)
    var bearing: Orientation
    
    init(corordinates: [Int] = [0, 0], bearing: Orientation = .north) {
        self.coordinates.x = corordinates[0]
        self.coordinates.y = corordinates[1]
        self.bearing = bearing
    }
    
    mutating func orient(_ direction: Orientation) {
        self.bearing = direction
    }
    
    mutating func turnRight() {
        bearing.turn(.turnRight)
    }
    
    mutating func turnLeft() {
        bearing.turn(.turnLeft)
    }
    
    mutating func at(x: Int, y: Int) {
        coordinates.x = x
        coordinates.y = y
    }
    
    mutating func advance() {
        switch bearing {
        case .north:
            coordinates.y += 1
        case .east:
            coordinates.x += 1
        case .west:
            coordinates.x -= 1
        case .south:
            coordinates.y -= 1
        }
    }
    
    mutating func evaluate(_ sequence: String) {
        let validSet = CharacterSet(charactersIn: "LRA")
        guard sequence.rangeOfCharacter(from: validSet) != nil else { return }
        sequence.forEach { move(Instruction(rawValue: $0)!) }
    }
    
    func instructions(_ list: String) -> [Instruction] {
        return Instruction.instructions(from: list)
    }
    
    mutating func move(_ instruction: Instruction)  {
        switch instruction {
        case .advance:
            advance()
        case .turnLeft:
            turnLeft()
        case .turnRight:
            turnRight()
        }
    }
    
    mutating func place(x: Int, y: Int, direction: Orientation) {
        at(x: x, y: y)
        orient(direction)
    }
}

