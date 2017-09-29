//Solution goes in Sources

import Cocoa

struct Gigasecond {
    var from: String
    let formatter: DateFormatter
    var dateFrom: Date?
    let additionalTime = 1_000_000_000.0
    var description: String {
        let yearsLater = dateFrom!.addingTimeInterval(additionalTime)
        return formatter.string(from: yearsLater)
    }
    
    init?(from: String) {
        self.from = from
        formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFrom = formatter.date(from: from)
        if dateFrom == nil {
            return nil
        }
    }
}
