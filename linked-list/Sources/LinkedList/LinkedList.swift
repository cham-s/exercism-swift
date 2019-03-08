class LinkedListNode<T> {
    public var value: T
    public var next: LinkedListNode?
    public var previous: LinkedListNode?
    
    init(value: T) {
        self.value = value
    }
}

class Deque<T> {
    public var first: LinkedListNode<T>?
    public var last: LinkedListNode<T>?
    
    public func push(_ value: T) {
        guard  first != nil  else {
            first = LinkedListNode(value: value)
            last = first
            return
        }
        let previous = last
        last?.next = LinkedListNode(value: value)
        last = last?.next
        last?.previous = previous
    }
    
    public func pop() -> T? {
        guard last != nil else {
            return nil
        }
        let currentLastValue = last?.value
        last = last?.previous
        last?.next = nil
        return currentLastValue
    }
    
    public func shift() -> T? {
        guard first != nil else {
            return nil
        }
        let currentFirstValue = first?.value
        first = first?.next
        first?.previous = nil
        return currentFirstValue
    }
    
    public func unshift(_ value: T) {
        guard  first != nil  else {
            first = LinkedListNode(value: value)
            last = first
            return
        }
        let new = LinkedListNode(value: value)
        new.next = first
        first?.previous = new
        first = new
    }
}


