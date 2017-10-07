//Solution goes in Sources

class GradeSchool {
    var roster = [Int: [String]]()
    var sortedRoster: [Int: [String]] {
        return roster.mapValues { students in students.sorted() { $0 < $1 } }
    }
    
    func addStudent(_ name: String, grade: Int) {
        if roster[grade] != nil {
            roster[grade]!.append(name)
        } else {
            roster[grade] = [name]
        }
    }
    
    func studentsInGrade(_ grade: Int) -> [String] {
        guard roster[grade] != nil else {
            return [String]()
        }
        return roster[grade]!
    }
}
