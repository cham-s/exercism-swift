//Solution goes in Sources

struct Clock {
    typealias Minutes = Int
    typealias Hours = Int
    let minutesInAnHour: Minutes = 60
    var hours: Hours
    var minutes: Minutes
    
    init(hours: Hours = 0, minutes: Minutes = 0) {
        self.hours = hours
        self.minutes = minutes
    }
    
    var description: String {
        let totalMinutes: Minutes = (hours * minutesInAnHour) + minutes
        let finalHours: Hours = totalMinutes / minutesInAnHour
        let finalMinutes: Minutes = totalMinutes % minutesInAnHour
        return String(format: "%d:%d", finalHours, finalMinutes)
    }
}
