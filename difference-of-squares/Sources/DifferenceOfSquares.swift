//Solution goes in Sources

import Foundation

struct Squares {
    var value: Int
    private var range: CountableClosedRange<Int> {
        return 1...value
    }
    var squareOfSums: Int {
        let sum = range.reduce(0) { $0 + $1 }
        return Int(pow(Double(sum), 2))
    }
    var sumOfSquares: Int {
        return range.map() { Int(pow(Double($0), 2)) }
            .reduce(0) { $0 + $1 }
    }
    var differenceOfSquares: Int {
        return squareOfSums - sumOfSquares
    }
    
    init(_ value: Int) {
        self.value = value
    }
}
