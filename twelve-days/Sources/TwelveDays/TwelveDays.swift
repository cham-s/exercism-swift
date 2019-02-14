struct TwelveDaysSong {
    private static let elements = [
        ("first",   "a",      "Partridge in a Pear Tree"),
        ("second",  "two",    "Turtle Doves"),
        ("third",   "three",  "French Hens"),
        ("fourth",  "four",   "Calling Birds"),
        ("fifth",    "five",   "Gold Rings"),
        ("sixth",   "six",    "Geese-a-Laying"),
        ("seventh", "seven",  "Swans-a-Swimming"),
        ("eighth",   "eight",  "Maids-a-Milking"),
        ("ninth",   "nine",   "Ladies Dancing"),
        ("tenth",   "ten",    "Lords-a-Leaping"),
        ("eleventh","eleven", "Pipers Piping"),
        ("twelfth",  "twelve", "Drummers Drumming")
    ]
    
    public static func verses(_ low: Int, _ high: Int) -> String {
        guard low > 0 else { return "" }
        
        precondition(low < high, "Fatal error: upperBound: \(low) < lowerBound\(high) ")
        return (low...high).map { verse($0) }.joined(separator: "\n")
    }
    
    public static func verse(_ day: Int) -> String {
        var line = "On the \(elements[day - 1].0) day of Christmas my true love gave to me: "
        guard day > 1 else {
            return line +  "\(elements[day - 1].1) \(elements[day - 1].2)."
        }
        line += (1...day).reversed().reduce("") {
            let addAnd = $1 == 1  ? "and " : ""
            let dotOrComa = $1 != 1 ? ", " : "."
            return $0 + "\(addAnd)\(elements[$1 - 1].1) \(elements[$1 - 1].2)\(dotOrComa)"
        }
        return line
    }
    
    public static func sing() -> String {
        return verses(1, 12)
    }
}
