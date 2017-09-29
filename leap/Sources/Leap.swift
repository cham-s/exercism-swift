//Solution goes in Sources

struct Year {
    var isLeapYear: Bool
    
    
    init(calendarYear: Int) {
        if calendarYear % 4 == 0 {
            if calendarYear % 100 == 0 {
                if calendarYear % 400 == 0 {
                    isLeapYear = true
                } else {
                    isLeapYear = false
                }
            } else {
                isLeapYear = true
            }
        } else {
            isLeapYear = false
        }
    }
}
