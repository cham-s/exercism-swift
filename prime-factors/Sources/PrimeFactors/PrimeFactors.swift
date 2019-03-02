public extension Int {
    public func isDivisibleBy(_ number: Int) -> Bool {
        return self % number == 0
    }
}

struct PrimeFactors {
    private var number: Int
    
    public var toArray: [Int] {
        var array: [Int] = []
        var currentValue = number
        var prime = 2
        while currentValue > 1 {
            if currentValue.isDivisibleBy(prime) {
                array.append(prime)
                currentValue /= prime
            } else {
                prime += 1
            }
        }
        return array
    }
    
    init(_ number: Int) {
        self.number =  number
    }
}
