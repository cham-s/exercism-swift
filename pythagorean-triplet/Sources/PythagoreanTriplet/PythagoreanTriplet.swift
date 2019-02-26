import Foundation

struct Triplet {
    var values: [Int] = []
    var sum: Int {
        return values.reduce(0, +)
    }
    
    var product: Int {
        return values.reduce(1, *)
    }
    
    var isPythagorean: Bool {
        return Triplet.isValidTriplet(values)
    }
    
    static private func isValidTriplet(_ input: [Int]) -> Bool {
        guard input.count == 3 else { return false }
        for i in 0..<input.count {
            let (a, b, c) = (input[i], input[(i + 1) % 3], input[(i + 2) % 3])
            let result = pow(Double(a), 2) + pow(Double(b), 2)
            if result == pow(Double(c), 2) {
                return true
            }
        }
        return false
    }
    
    init(_ f: Int, _ s: Int, _ t: Int) {
        values.append(contentsOf: [f, s, t])
    }
    
    static public func fromWhere(_ minFactor: Int = 1, maxFactor: Int) -> [Triplet] {
        let range = Array(minFactor...maxFactor)
        guard range.count >= 3 else { return [] }
        var array: [Triplet] = []
        var a = minFactor
        var b = minFactor + 1
        var c = minFactor + 2
        
        while a <= maxFactor {
            b = a + 1
            while b <= maxFactor {
                c = b + 1
                while c <= maxFactor {
                    if isValidTriplet([a, b, c]) {
                        array.append(Triplet(a, b, c))
                    }
                    c += 1
                }
                b += 1
            }
            a += 1
        }
        return array
    }
    
    static public func fromWhere(_ minFactor: Int = 1, maxFactor: Int, sum: Int) -> [Triplet] {
        let range = Array(minFactor...maxFactor)
        guard range.count >= 3 else { return [] }
        var array: [Triplet] = []
        var a = minFactor
        var b = minFactor + 1
        var c = minFactor + 2
        
        while a <= maxFactor {
            b = a + 1
            while b <= maxFactor {
                c = b + 1
                while c <= maxFactor {
                    if isValidTriplet([a, b, c]) {
                        let triplet = Triplet(a, b, c)
                        if triplet.sum == sum {
                            array.append(triplet)
                        }
                    }
                    c += 1
                }
                b += 1
            }
            a += 1
        }
        return array
    }
}

