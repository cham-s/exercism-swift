//Solution goes in Sources

extension Bool {
    var NOT: Bool {
        return !self
    }
}

struct DNA {
    let strand: String
    private let validNucleotides = "ATCG"
    
    init?(strand: String) {
        for character in strand {
            if validNucleotides.contains(character).NOT { return nil }
        }
        self.strand = strand
    }
    
    func count(_ nucleotide: Character) -> Int {
        let nucleotides = strand.filter { $0 == nucleotide }
        return nucleotides.count
    }
    
    func counts() -> [String: Int] {
        var strandsCount: [String: Int] = [ "A": 0, "T": 0, "C": 0, "G": 0 ]
        for character in strand { strandsCount[String(character)]! += 1 }
        return strandsCount
    }
}
