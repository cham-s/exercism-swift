struct Diamond {
    
    static private let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    
    static func makeDiamond(letter: Character) -> [String] {
        
        let lettersArray = Array(letters)
        guard let index = lettersArray.firstIndex(of: letter) else { return [] }
        guard letter != "A" else { return ["A"] }
        
        var output: [String] = []
        var sidePadding = index
        var middleSpaces = 0
        
        for l in 0...index {
            
            var line = String(repeating: " ", count: sidePadding)
            line += String(lettersArray[l])
            line += String(repeating: " ", count: middleSpaces)
            line +=  l == 0 ? "" : String(lettersArray[l])
            line += String(repeating: " ", count: sidePadding)
            output.append(line)
            sidePadding -= 1
            middleSpaces += l == 0 ? 1 : 2
        }
        
        return output + output.dropLast().reversed()
    }
}
