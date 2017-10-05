//Solution goes in Sources

import Foundation

struct Grains {
    
    enum GrainsError: Error {
        case inputTooHigh(String)
        case inputTooLow(String)
    }
    
    static var total: Decimal {
        let maxSquare = 64
        return (1...maxSquare).map { $0 == 1 ? 1.0 :  pow(2, $0 - 1) }.reduce(0, +)
    }
    
    static func square(_ number: Int) throws -> Decimal {
        switch number {
        case let number where number < 1:
            throw GrainsError.inputTooLow("Input[\(number)] invalid. Input should be between 1 and 64 (inclusive)")
        case let number where number > 64:
            throw GrainsError.inputTooHigh("Input[\(number)] invalid. Input should be between 1 and 64 (inclusive)")
        default:
            return number == 1 ? 1.0 :  pow(2, number - 1)
        }
    }
}
