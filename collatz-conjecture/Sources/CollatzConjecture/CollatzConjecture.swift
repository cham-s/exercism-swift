enum CollatzError: Error {
    case negative(Int)
    case zero
}

struct CollatzConjecture {
    static func steps(_ forNumber: Int) throws -> Int {
        guard forNumber != 0 else { throw CollatzError.zero }
        guard forNumber > 0 else { throw CollatzError.negative(forNumber) }
        
        let evenEval: Evaluation = { $0 / 2 }
        let oddEval: Evaluation = { (3 * $0) + 1 }
        var currentStep = 0
        var value = forNumber
        
        while value != 1 {
            value = value.isEven ? evenEval(value) : oddEval(value)
            currentStep += 1
        }
        return currentStep
    }
}

extension CollatzConjecture {
    typealias Evaluation = (Int) -> Int
}

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}
