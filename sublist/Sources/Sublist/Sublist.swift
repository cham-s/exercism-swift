enum Classifier {
    case equal
    case superlist
    case sublist
    case unequal
    
    init (first: [Int], second: [Int]) {
        switch (first, second) {
        case (let one, let two) where one.isEqual(to: two):
            self = .equal
        case (let one, let two) where one.isSuperList(of: two):
            self = .superlist
        case (let one, let two) where one.isSubList(of: two):
            self = .sublist
        default:
            self = .unequal
        }
    }
}

extension Array where Element: Comparable {
    func isEqual(to list: [Element]) -> Bool {
        return self == list
    }
    
    func isSubList(of list: [Element]) -> Bool {
        guard count != list.count else { return false }
        if isEmpty && !list.isEmpty {
            return true
        }
        
        var selfIndex = 0
        var listIndex = 0
        var lastIndex = 0
        while listIndex < list.count {
            while self[selfIndex] == list[lastIndex] {
                selfIndex += 1
                lastIndex += 1
                if selfIndex == count { return true }
                if lastIndex == list.count { return false }
            }
            listIndex += 1
            lastIndex = listIndex
            selfIndex = 0
        }
        return false
    }
    
    func isSuperList(of list: [Element]) -> Bool {
        guard count != list.count else { return false }
        if !isEmpty && list.isEmpty {
            return true
        }
        
        var selfIndex = 0
        var listIndex = 0
        var lastIndex = 0
        while selfIndex < count {
            while self[lastIndex] == list[listIndex] {
                listIndex += 1
                lastIndex += 1
                if listIndex == list.count { return true }
                if lastIndex == count { return false }
            }
            listIndex = 0
            selfIndex += 1
            lastIndex = selfIndex
            
        }
        return false
    }
}

func classifier(listOne: [Int], listTwo: [Int]) -> Classifier {
    return Classifier(first: listOne, second: listTwo)
}

