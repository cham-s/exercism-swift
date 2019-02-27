import Foundation

struct SaddlePointsMatrix {
    var matrixStr: String
    var rows: [[Int]] {
        return matrixStr.split(separator: "\n")
            .map { $0.split(separator: " ").map { Int($0)! } }
    }
    
    var columns: [[Int]] {
        let count = rows[0].count
        return (0..<count).reduce([]) { partial, index in
            partial + [ rows.map { $0[index] } ]
        }
    }
    
    var saddlePoints: [[Int]] {
        var array: [[Int]] = []
        for (i, row) in rows.enumerated() {
            for (j, col)  in columns.enumerated() {
                if rows[i][j] == row.max()! && rows[i][j] == col.min()! {
                    array.append([i, j])
                }
            }
        }
        return array
    }
    
    init(_ matrix: String) {
        matrixStr = matrix
    }
}

