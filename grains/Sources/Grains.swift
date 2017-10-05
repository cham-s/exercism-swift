//Solution goes in Sources

import Foundation

struct Grains {
    
    enum GrainsError: Error {
        case inputTooHigh(String)
        case inputTooLow(String)
    }
    
    static var total: UInt64 {
        let maxSquare: UInt64 = 64
        let squares = (1...maxSquare).map { $0 == 1 ? 1 :  UInt64(pow(Double(2), Double($0) - 1)) }
        return squares.reduce(0) { $0 + $1 }
    }
    
    static func square(_ number: Int) throws -> UInt64 {
        switch number {
        case let number where number < 1:
            throw GrainsError.inputTooLow("Input[\(number)] invalid. Input should be between 1 and 64 (inclusive)")
        case let number where number > 64:
            throw GrainsError.inputTooHigh("Input[\(number)] invalid. Input should be between 1 and 64 (inclusive)")
        default:
            return UInt64(number == 1 ? 1.0 :  pow(Double(2), Double(number) - 1))
        }
    }
}

