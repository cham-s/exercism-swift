class Element<T> {
    var value: T?
    var next: Element?
    private var start: Element?
    
    init(_ value: T? = nil, _ next: Element? = nil) {
        self.value = value
        self.next = next
        start = next
    }
    
    func toArray() -> [T] {
        var array: [T] = []
        if let val = value {
            array.append(val)
        }
        var tmp = next
        while let nextNode = tmp {
            if let val = nextNode.value {
                array.append(val)
                tmp = tmp?.next
            }
        }
        return array
    }
    
    func reverseElements() -> Element {
        var previous: Element? = nil
        var current: Element? = self
        var next: Element?
        
        while current != nil {
            next = current?.next
            current?.next = previous
            previous = current
            current = next
        }
        
        return previous!
    }
    
    static func fromArray(_ array: [T]) -> Element {
        guard array.isEmpty == false else { return Element() }
        guard array.count > 1 else { return Element(array[0], nil) }
        return (1..<array.count).reduce(Element(array[0], nil)) {
            Element(array[$1], $0)
            }.reverseElements()
    }
}

