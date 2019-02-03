struct Sieve {
    var limit = 0
    
    lazy var primes: [Int] = {
        guard limit > 2 else { return [] }
        var primes: [Int] = []
        var marked: Set<Int> = []
        let numbers = 2...limit
        
        for i in numbers.indices where !marked.contains(numbers[i]) {
            primes.append(numbers[i])
            for number in numbers[i...] where number != numbers[i] &&
                !marked.contains(number) {
                    if number % numbers[i] == 0 {
                        marked.insert(number)
                    }
            }
        }
        return primes
    }()
    
    init(_ limit: Int) {
        self.limit = limit
    }
}
