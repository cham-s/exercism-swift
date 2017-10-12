//Solution goes in Sources

import Foundation

struct Clock {
    typealias Minutes = Int
    typealias Hours = Int
    let minutesInAnHour: Minutes = 60
    let dayInHours = 24
    var hours: Hours
    var minutes: Minutes
    
    init(hours: Hours = 0, minutes: Minutes = 0) {
        self.hours = hours
        self.minutes = minutes
    }
    
    var description: String {
        let totalMinutes: Minutes = (hours * minutesInAnHour) + minutes
        let finalHours: Hours = (totalMinutes / minutesInAnHour) % dayInHours
        let finalMinutes: Minutes = totalMinutes % minutesInAnHour
        return String(format: "%02d:%02d", finalHours, finalMinutes)
    }
}

