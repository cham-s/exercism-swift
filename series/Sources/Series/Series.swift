import Foundation

struct Series {
    public var number: String
    
    init(_ number: String) {
        self.number = number
    }
    
    public func slices(_ limit: Int) -> [[Int]] {
        guard (Int(number)) != nil else { return [[]] }
        var array: [[Int]] = []
        
        let count = number.count - limit
        for startOffset in stride(from: 0, through: count, by: 1) {
            let startIndex = number.index(number.startIndex, offsetBy: startOffset)
            let endIndex = number.index(startIndex, offsetBy: limit)
            let numbers = number[startIndex..<endIndex].map { Int(String($0))! }
            array.append(numbers)
        }
        return array
    }
}

