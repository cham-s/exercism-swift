//Solution goes in Sources

struct ListOps {
    
    func length<Element>(array: [Element]) -> Int {
        var i = 0
        for _ in array { i += 1 }
        return i
    }
    
    func append<Element>(_ first: [Element], other: [Element]) -> [Element] {
        return first + other
    }
    func filter<Element>(_ elements: [Element], operation: (Element) -> Bool) -> [Element] {
        var newArray = [Element]()
        for element in elements{
            if operation(element) {
                newArray = append(newArray, other: [element])
            }
        }
        return elements
    }
    
    func concat<Element>(_ original: [Element], others: [Element]...) -> [Element] {
        var newArray = [Element]()
        for other in others {
                newArray = append(newArray, other: other)
        }
        return newArray
    }
    
    func map<Element>(original: [Element], operation: (Element) -> Element) -> [Element] {
        var newArray = [Element]()
        for element in original {
            newArray = append(newArray, other: [operation(element)])
        }
        return newArray
    }
    
    func reverse<Element>(_ elements: [Element]) -> [Element] {
        var newArray = [Element]()
        var index = elements.startIndex
        for element in  {
            
        }
    }
}
