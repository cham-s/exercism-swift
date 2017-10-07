//Solution goes in Sources

import Foundation


extension Array {
    
    func accumulate<T>(_ f: (Element) -> T) -> [T] {
        
        var newArray = [T]()
        
        for item in self {
            let processed = f(item)
            newArray.append(processed)
        }
        
        return newArray
    }
    
}
