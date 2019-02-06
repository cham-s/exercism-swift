import Foundation

enum BinarySearchError: Error {
    case unsorted
}

struct BinarySearch {
    
    var list: [Int] = []
    var middle: Int {
        return (list.count - 1) / 2
    }
    
    init(_ list: [Int]) throws {
        guard list.isSorted else {
            throw BinarySearchError.unsorted
        }
        self.list = list
    }
    
    func searchFor(_ key: Int) -> Int? {
        var start = 0
        var end = list.count - 1
        var middle = (start + end) / 2
        var length = list.count - start
        repeat {
            if list[middle] == key {
                return middle
            }
            if list[middle] > key {
                end = middle - 1
            } else {
                start = middle + 1
            }   
            middle = (start + end) / 2
            length = (end - start) + 1
        } while length > 0
        return nil
    }
}

extension Collection where Iterator.Element: Comparable {
    var isSorted: Bool {
        var currentIndex = startIndex
        var nextIndex = index(currentIndex, offsetBy: 1)
        while nextIndex != endIndex {
            if self[nextIndex] < self[currentIndex] {
                return false
            }
            currentIndex = index(currentIndex, offsetBy: 1)
            nextIndex = index(nextIndex, offsetBy: 1)
        }
        return true
    }
}

