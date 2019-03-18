import Foundation

func RomanNumeral(_ number: Int) -> String {
    let strNumber = String(number).reversed()
    var decomposed: [(Int, Int)] = []
    var power = 0
    
    for value in strNumber {
        let key = Int(pow(10.0, Double(power)))
        decomposed.append((key, Int(String(value))!))
        power += 1
    }
    
    return decomposed.reversed().reduce("") { partial, n in
        switch n {
        case (1, let times):
            var returnValue = ""
            if times < 4 {
                returnValue = String(repeating: "I", count: times)
            } else if times == 4 {
                returnValue = "IV"
            } else if times < 9 {
                returnValue = "V" + String(repeating: "I", count: times - 5)
            } else {
                returnValue = "IX"
            }
            return partial + returnValue
            
        case (10, let times):
            var returnValue = ""
            if times < 4 {
                returnValue = String(repeating: "X", count: times)
            } else if times == 4 {
                returnValue = "XL"
            } else if times < 9 {
                returnValue = "L" + String(repeating: "X", count: times - 5)
            } else {
                returnValue = "XC"
            }
            return partial + returnValue
        case (100, let times):
            var returnValue = ""
            if times < 4 {
                returnValue = String(repeating: "C", count: times)
            } else if times == 4 {
                returnValue = "CD"
            } else if times < 9 {
                returnValue = "D" + String(repeating: "C", count: times - 5)
            } else {
                returnValue = "CM"
            }
            return partial + returnValue
        default:
            return partial + String(repeating: "M", count: n.1)
        }
    }
}
