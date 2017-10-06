//Solution goes in Sources

extension Array {
    func accumulate(_ accumulator: (Element) -> Element) -> [Element] {
        var newArray = [Element]()
        for element in self {
            newArray.append(accumulator(element))
        }
        return newArray
    }
}
