//Solution goes in Sources

struct ListOps {
    static func append<Element>(_ destination: [Element],
                                _ source: [Element]) -> [Element] {
        return destination + source
    }
    
    static func concat<Element>(_ list: [Element]...) -> [Element] {
        var array: [Element] = []
        for item in list {
            array = ListOps.append(array, item)
        }
        return array
    }
    
    static func filter<Element>(_ source: [Element],
                                _ predicate: (Element) -> Bool) -> [Element] {
        var array: [Element] = []
        for item in source where predicate(item) == true {
            array = ListOps.append(array, [item])
        }
        return array
    }
    
    static func length<Element>(_ source: [Element]) -> Int {
        var count = 0
        for _ in source {
            count += 1
        }
        return count
    }
    
    static func map<Element>(_ source: [Element],
                             _ transform: (Element) -> Element) -> [Element] {
        var array: [Element] = []
        for item in source {
            array = ListOps.append(array, [transform(item)])
        }
        return array
    }
    
    static func foldLeft<Element>(_ source: [Element],
                                  accumulated: Element,
                                  combine: (Element, Element) -> Element) -> Element {
        var result = accumulated
        for item in source {
            result = combine(result, item)
        }
        return result
    }
    
    static func foldRight<Element>(_ source: [Element],
                                   accumulated: Element,
                                   combine: (Element, Element) -> Element) -> Element {
        var result = accumulated
        for item in ListOps.reverse(source) {
            result = combine(item, result)
        }
        return result
    }
    
    static func reverse<Element>(_ source: [Element]) -> [Element] {
        let count = ListOps.length(source)
        var index = count - 1
        var array: [Element] = []
        
        while index >= 0 {
            array = ListOps.append(array, [source[index]])
            index -= 1
        }
        
        return array
    }
}
