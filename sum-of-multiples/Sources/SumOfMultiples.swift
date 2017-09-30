//Solution goes in Sources

struct SumOfMultiples {
    static func toLimit(_ limit: Int, inMultiples multiples: [Int]) -> Int {
        guard limit > 0 else {
            return 0
        }
        let range = 1..<limit
        return range.filter() {
            for number in multiples {
                guard number > 0 else {
                    continue
                }
                if $0 % number == 0 { return true }
            }
            return false
            }.reduce(0, +)
    }
}
