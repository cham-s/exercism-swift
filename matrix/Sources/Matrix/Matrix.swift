struct Matrix {
    var strMatrix: String
    var rows: [[Int]] {
        guard strMatrix.isEmpty == false else { return [] }
        return strMatrix.split(separator: "\n")
            .map { $0.split(separator: " ")
                .map { Int(String($0))! } }
    }
    
    var columns: [[Int]] {
        var array: [[Int]] = []
        guard rows.isEmpty == false else { return [] }
        let count = rows.first!.count
        
        for col in 0..<count {
            var numbers: [Int] = []
            for row in rows {
                numbers.append(row[col])
            }
            array.append(numbers)
        }
        return array
    }
    
    init(_ strMatrix: String) {
        self.strMatrix = strMatrix
    }
}

