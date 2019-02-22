import Foundation


struct NumberSeries {
    enum NumberSeriesError: Error {
        case negativeSpan
        case invalidCharacter
        case spanLongerThanStringLength
    }
    
    var number: String
    
    init(_ number: String) {
        self.number = number
    }
    
    public func largestProduct(_ span: Int) throws -> Int {
        guard span > 0 else {
            if span == 0 { return 1 }
            throw NumberSeriesError.negativeSpan
        }
        guard span <= number.count else {
            throw NumberSeriesError.spanLongerThanStringLength
        }
        guard (number.rangeOfCharacter(from:
            CharacterSet.decimalDigits.inverted)) == nil else {
                throw NumberSeriesError.invalidCharacter
        }
        
        var largest = 0
        let limit = number.count - span
        
        for startOffset in stride(from: 0, through: limit, by: 1) {
            let startIndex = number.index(number.startIndex, offsetBy: startOffset)
            let endIndex = number.index(startIndex, offsetBy: span)
            let product = number[startIndex..<endIndex]
                .map { Int(String($0))! }.reduce(1, *)
            largest = product > largest ? product : largest
        }
        return largest
    }
}

