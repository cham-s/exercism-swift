
struct Triangle {
    var firstSide: Double = 0
    var secondSide: Double = 0
    var thirdSide: Double = 0
    
    init(_ firstSide: Double, _ secondSide: Double, _ thridSecond: Double) {
        self.firstSide = firstSide
        self.secondSide = secondSide
        self.thirdSide = thridSecond
    }
    
    var kind: String {
        guard firstSide > 0 && secondSide > 0 && thirdSide > 0 else {
            return "ErrorKind"
        }
        guard firstSide + secondSide > thirdSide &&
            firstSide + thirdSide > secondSide &&
            secondSide + thirdSide > firstSide else {
                return "ErrorKind"
        }
        
        if firstSide == secondSide && firstSide == thirdSide {
            return "Equilateral"
        }
        if firstSide == secondSide ||  secondSide == thirdSide ||
            firstSide == thirdSide  {
            return "Isosceles"
        }

        return "Scalene"
    }
}

