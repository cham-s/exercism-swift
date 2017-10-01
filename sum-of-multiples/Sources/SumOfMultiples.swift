//Solution goes in Sources

//struct SumOfMultiples {
//    static func toLimit(_ limit: Int, inMultiples multiples: [Int]) -> Int {
//        guard limit > 0 else {
//            return 0
//        }
//        let range = 1..<limit
//        return range.filter() {
//            for number in multiples {
//                guard number > 0 else {
//                    continue
//                }
//                if $0 % number == 0 { return true }
//            }
//            return false
//            }.reduce(0, +)
//    }
//}

import Foundation

class SumOfMultiples:NSObject {
    
    static func toLimit(_ limit: Int, inMultiples: [Int]) -> Int {
        
        let zeroFreeMultiples = inMultiples.filter({$0 != 0})
        
        return (1..<limit).filter({checkMultiple(num: $0, multiples: zeroFreeMultiples)}).reduce(0, +)
    }
    
    static func checkMultiple(num: Int, multiples: [Int]) -> Bool {
        for multiple in multiples {
            if num % multiple == 0 {
                return true
            }
        }
        return false
    }
}
