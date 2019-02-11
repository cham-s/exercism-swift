enum CircularBufferError: Error {
    case bufferEmpty
    case bufferFull
}

class CircularBuffer<T>: CustomStringConvertible {
    var description: String {
        var output = ""
        _buffer.forEach {
            if let e = $0 {
                output += "[ \(e) ]"
            } else {
                output += "[  ]"
            }
        }
        return output
    }
    
    private struct Index {
        var last = 0
        var oldest = 0
        
        mutating public func reset() {
            last = 0
            oldest = 0
        }
    }
    
    private var _buffer: ContiguousArray<T?> = []
    private var _capacity: Int
    private var _used = 0
    private var _indices = Index()
    private var _bufferIsFull: Bool { return _used == _capacity }
    private var _bufferIsEmpty: Bool { return _used == 0 }
    
    init(capacity: Int) {
        _buffer.reserveCapacity(capacity)
        _capacity = capacity
        for _ in 0..<capacity { _buffer.append(nil) }
    }
    
    public func write(_ data: T) throws {
        guard _bufferIsFull == false else {
            throw CircularBufferError.bufferFull
        }
        
        _buffer[_indices.last] = data
        _indices.last = (_indices.last + 1) % _capacity
        _used += 1
    }
    
    public func read() throws -> T {
        guard _bufferIsEmpty == false else {
            throw CircularBufferError.bufferEmpty
        }
        
        let data = _buffer[_indices.oldest]
        _used -= 1
        _indices.oldest = (_indices.oldest + 1) % _capacity
        return data!
    }
    
    public func clear() {
        _indices.reset()
        _used = 0
    }
    
    public func overwrite(_ withData: T)  {
        _buffer[_indices.oldest] = withData
        _indices.oldest = (_indices.oldest + 1) % _capacity
        if _bufferIsFull == false {
            _used += 1
        }
    }
}

