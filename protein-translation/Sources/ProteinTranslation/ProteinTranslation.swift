import Foundation

enum TranslationError: Error {
    case invalidCordon(String)
    case invalidInputCount(Int)
    case emptySequence
}

struct ProteinTranslation {
    
    private static let cordonsProteins = [
        "Methionine": ["AUG"],
        "Phenylalanine": ["UUU", "UUC"],
        "Leucine": ["UUA", "UUG"],
        "Serine": ["UCU", "UCC", "UCA", "UCG"],
        "Tyrosine": ["UAU", "UAC"],
        "Cysteine": ["UGU", "UGC"],
        "Tryptophan": ["UGG"],
        "STOP": ["UAA", "UAG", "UGA"]
    ]
    
    private static var cordons: [String] {
        return cordonsProteins.values.flatMap { $0 }
    }
    
    static func translationOfRNA(_ input: String) throws -> [String] {
        guard !input.isEmpty else { throw TranslationError.emptySequence }
        
        var array: [String] = []
        let startIndex = input.startIndex
        let count = input.count - 3
        
        for startOffset in stride(from: 0, through: count, by: 3) {
            let start = input.index(startIndex, offsetBy: startOffset)
            let end = input.index(start, offsetBy: 3)
            let slice = String(input[start..<end])
            
            guard cordons.contains(slice) else {
                throw TranslationError.invalidCordon(slice)
            }
            guard cordonsProteins["STOP"]!.contains(slice) == false else {
                break
            }
            for (key, value) in cordonsProteins {
                if value.contains(slice) {
                    array.append(key)
                }
            }
        }
        return array
    }
    
    static func translationOfCodon(_ input: String) throws -> String {
        guard cordons.contains(input) else {
            throw TranslationError.invalidCordon(input)
        }
        var translation = ""
        for (key, value) in cordonsProteins {
            if value.contains(input) {
                translation = key
                break
            }
        }
        return translation
    }
}

