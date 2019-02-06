func flattenArray<T>(_ input: [Any]) -> [T] {
    var array: [T] = []
    
    for item in input {
        if item is [Any] {
            let any = item as! [Any]
            array += flattenArray(any)
        } else {
            if let value = item as? T {
                array.append(value)
            }
        }
    }
    return array
}

