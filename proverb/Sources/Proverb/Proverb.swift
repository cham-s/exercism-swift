extension Array where Element == String {
    func recite() -> String {
        var output = ""
        for index in indices {
            guard index != count - 1 else {
                output += "And all for the want of a \(self[0])."
                continue
            }
            output += "For want of a \(self[index]) the \(self[index + 1]) was lost.\n"
        }
        return output
    }
}
