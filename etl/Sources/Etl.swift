//Solution goes in Sources

struct ETL {
    static func transform(_ old: [Int: [String]]) -> [String: Int] {
        var new = [String: Int]()
        old.forEach { key, value in
            value.forEach { letter in 
                new[letter.lowercased()] = key
            }
        }
        return new
    }
}
