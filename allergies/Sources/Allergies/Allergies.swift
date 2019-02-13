func &<T: UnsignedInteger>(lhs: T, rhs: T) -> Bool {
    return lhs & rhs != 0
}

enum Allergy: UInt, CaseIterable {
    case eggs = 1
    case peanuts =  2
    case shellfish = 4
    case strawberries = 8
    case tomatoes = 16
    case chocolate = 32
    case pollen = 64
    case cats = 128
}

struct Allergies {
    var score: UInt
    
    init(_ score: UInt) {
        self.score = score
    }
    
    func hasAllergy(_ allergy: Allergy) -> Bool {
        return allergy.rawValue & score
    }
}
