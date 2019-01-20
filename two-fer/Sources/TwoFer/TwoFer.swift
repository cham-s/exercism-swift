//Solution goes in Sources

struct TwoFer {
    static func twoFer(name: String = "") -> String {
        guard name.isEmpty else {
            return "One for \(name), one for me."
        }
        return "One for you, one for me."
    }
}
