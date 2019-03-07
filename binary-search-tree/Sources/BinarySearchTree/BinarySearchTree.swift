class BinarySearchTree<T: Comparable> {
    public var data: T
    public var right: BinarySearchTree?
    public var left: BinarySearchTree?
    
    init(_ value: T) {
        self.data = value
    }
    
    public func insert(_ value: T) {
        func insertIn(_ bst: BinarySearchTree) {
            let side = value > bst.data ? bst.right : bst.left
            guard let currentSide = side else {
                if value > bst.data {
                    bst.right = BinarySearchTree(value)
                } else if value == bst.data {
                    bst.data = value
                } else {
                    bst.left = BinarySearchTree(value)
                }
                return
            }
            insertIn(currentSide)
        }
        insertIn(self)
    }
    
    public func allData() -> [T] {
        
        var array: [T] = []
        
        func traverse(_ node: BinarySearchTree?) {
            if let node = node {
                traverse(node.left)
                array.append(node.data)
                traverse(node.right)
            }
        }
        traverse(self)
        return array
    }
}
