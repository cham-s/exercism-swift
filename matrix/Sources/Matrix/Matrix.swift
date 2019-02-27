struct Matrix {
    var strMatrix: String
    var rows: [[Int]] {
        guard strMatrix.isEmpty == false else { return [] }
        return strMatrix.split(separator: "\n")
            .map { $0.split(separator: " ")
                .map { Int(String($0))! } }
    }
    
    var columns: [[Int]] {
        let count = rows[0].count
        return (0..<count).reduce([]) { partial, index in
            partial + [ rows.map { $0[index] } ]
        }
    }
    
    init(_ strMatrix: String) {
        self.strMatrix = strMatrix
    }
}

