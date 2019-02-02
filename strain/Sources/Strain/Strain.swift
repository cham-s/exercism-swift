//Solution goes in Sources

extension Collection {
    func discard(_ predicate: (Element) throws -> Bool)
        rethrows -> [Element] {
            var array = ContiguousArray<Element>()
            var iterator = self.makeIterator()
            
            while let element = iterator.next() {
                if try predicate(element) == false {
                    array.append(element)
                }
            }
            
            return Array(array)
    }
    
    func keep(_ predicate: (Element) throws -> Bool)
        rethrows -> [Element] {
            var array = ContiguousArray<Element>()
            var iterator = self.makeIterator()
            
            while let element = iterator.next() {
                if try predicate(element) {
                    array.append(element)
                }
            }
            
            return Array(array)
    }
}

