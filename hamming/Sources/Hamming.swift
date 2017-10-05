//Solution goes in Sources

import Foundation


struct Hamming {
    static func compute(_ with: String, against: String) -> Int? {
        guard with.count == against.count else {
            return nil
        }
        
        let withArray = Array(with)
        let angainstArray = Array(against)
        var hammingDistance = 0
        for i in 0..<with.count {
            hammingDistance += withArray[i] == angainstArray[i] ? 0 : 1
        }
        return hammingDistance
    }
}

