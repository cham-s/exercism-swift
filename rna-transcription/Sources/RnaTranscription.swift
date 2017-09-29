//Solution goes in Sources

enum TranscriptionError: Error {
    case invalidNucleotide
}

struct Nucleotide {
    var value: String
    
    init(_ value: String) {
        self.value = value
    }
    
    func complementOfDNA() throws -> String {
        var newValue = ""
        for character in value {
            switch character {
            case "C":
                newValue += "G"
            case "G":
                newValue += "C"
            case "T":
                newValue += "A"
            case "A":
                newValue += "U"
            default:
                throw TranscriptionError.invalidNucleotide
            }
        }
        return newValue
    }
}
