struct Matrix {
    var strMatrix: String
    var rows: [[Int]] {
        return strMatrix.split(separator: "\n")
            .map { $0.split(separator: " ")
                .map { Int(String($0))! } }
    }
    
    var columns: [[Int]] {
        var array: [[Int]] = []
        let count = rows.first!.count
        
        for col in 0..<count {
            var numbers: [Int] = []
            for row in rows {
                let number = Int(String(Array(row)[col]))!
                numbers.append(number)
            }
            array.append(numbers)
        }
        return array
    }
    
    init(_ strMatrix: String) {
        self.strMatrix = strMatrix
    }
}

