import Foundation

enum BaseError: Error {
    case negativeDigit
    case invalidPositiveDigit
    case invalidInputBase
    case invalidOutputBase
}

struct Base {
    static func outputDigits(inputBase: Int,
                             inputDigits: [Int],
                             outputBase: Int) throws -> [Int] {
        guard inputBase > 1 else {
            throw BaseError.invalidInputBase
        }
        guard inputDigits.isEmpty == false || inputBase > 1 else {
            throw BaseError.invalidInputBase
        }
        guard (inputDigits.first { $0 < 0 }) == nil else {
            throw BaseError.negativeDigit
        }
        guard (inputDigits.first { $0 > inputBase - 1 }) == nil else {
            throw BaseError.invalidPositiveDigit
        }
        guard outputBase > 1 else {
            throw BaseError.invalidOutputBase
        }
        let zipped = zip(inputDigits, (0..<inputDigits.count).reversed())
        var result = zipped.map { $0 *  Int(pow(Double(inputBase), Double($1))) }
            .reduce(0, +)
        var array: [Int] = []
        while result != 0 {
            array.append(result % outputBase)
            result /= outputBase
        }
        return Array(array.reversed())
    }
}

