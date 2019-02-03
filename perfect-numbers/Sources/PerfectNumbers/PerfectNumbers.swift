enum NumberClassifier {
    case perfect
    case abundant
    case deficient
}

extension NumberClassifier {
    init(number: Int) {
        let result = (1..<number).filter { number % $0 == 0 }.reduce(0, +)
        switch result {
        case let value where value == number :
            self = .perfect
        case let value where value > number:
            self = .abundant
        default:
            self = .deficient
        }
    }
}

extension NumberClassifier {
    var classification: NumberClassifier {
        return self
    }
}

