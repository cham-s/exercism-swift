public extension Int {
    func factorial() -> Int {
        guard self > 1 else { return 1 }
        return (1...self).reversed().reduce(1) { $0 * $1 }
    }
}

public extension Int {
    func choose(k: Int) -> Int {
        return self.factorial() / (k.factorial() * (self - k).factorial())
    }
}

class PascalsTriangle {
    
    private var size: Int
    public lazy var rows: [[Int]] = {
        return (0...size).reduce([]) { (p1, i1) in
            p1 + [ (0...i1).reduce([]) { (p2, i2) in
                p2 + [i1.choose(k: i2)]
                } ]
        }
    }()
    
    init(_ size: Int) {
        self.size = size - 1
    }
}
