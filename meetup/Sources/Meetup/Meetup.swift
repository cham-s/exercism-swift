import Foundation

typealias Day = Int
typealias Month = Int
typealias Year = Int
typealias Option = String

public extension DateFormatter {
    func format(withLocal: String, andFormat: String) {
        self.locale = Locale(identifier: withLocal)
        self.dateFormat = andFormat
    }
}

enum DayOfWeek: Int {
    case sunday = 1
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    
    init (day: Day) throws {
        guard let dayOfweek = DayOfWeek(rawValue: day) else {
            throw DescriptorError.invalidDayComponent(day)
        }
        self = dayOfweek
    }
}

enum DescriptorError: Error {
    case notValidDescriptor(String)
    case invalidDayComponent(Int)
    case invalidDate(String)
}

enum Descriptor {
    case ordinal(Int)
    case last
    case teenth
    
    init (_ descriptor: String) throws {
        switch descriptor {
        case "1st", "2nd", "3rd", "4th":
            self = .ordinal(Int(String(descriptor.first!))! - 1)
        case "last":
            self = .last
        case "teenth":
            self = .teenth
        default:
            throw DescriptorError.notValidDescriptor(descriptor)
        }
    }
}

public extension Calendar {
    public var weekDayRange: Range<Int> { return 0..<7 }
    public var teenthRange: Range<Int> { return 12..<19 }
    
    internal func date(for descriptor: Descriptor, day: DayOfWeek, firstDay: Date) -> Date? {
        switch descriptor {
        case .ordinal(let nth):
            let nthWeek = date(byAdding: .weekOfMonth,
                               value: nth,
                               to: firstDay)!
            return date(for: day, range: weekDayRange, to: nthWeek)
        case .last:
            
            let weekOffset = range(of: .day,
                                   in: .month,
                                   for: firstDay)!.upperBound / 7
            let lastWeek = date(byAdding: .weekOfMonth,
                                value: weekOffset,
                                to: firstDay)!
            return date(for: day, range: weekDayRange, to: lastWeek)
        case .teenth:
            return date(for: day, range: teenthRange, to: firstDay)
        }
    }
    
    private func date(for day: DayOfWeek, range: Range<Int>, to: Date ) -> Date? {
        for i in range {
            let currentDay = date(byAdding: .day,
                                  value: i,
                                  to: to)!
            if component(.weekday, from: currentDay) == day.rawValue {
                return currentDay
            }
        }
        return nil
    }
}

class Meetup {
    public struct MeetupDate: CustomStringConvertible {
        public var year: Year = 0
        public var month: Month = 0
        public var day: Day = 0
        
        init(year: Year, month: Month) {
            self.year = year
            self.month = month
        }
        
        public var description: String {
            return String(format: "%d-%02d-%02d", year, month, day)
        }
        
        public mutating func update(with dayOfWeek: Day, andOption: Option) throws {
            let descriptor = try Descriptor(andOption)
            let day = try DayOfWeek(day: dayOfWeek)
            let dateFormatter = DateFormatter()
            dateFormatter.format(withLocal: "en_US_POSIX", andFormat: "yyyy-MM")
            
            let dateStr = "\(year)-\(month)"
            guard let date = dateFormatter.date(from: dateStr) else {
                throw DescriptorError.invalidDate(dateStr)
            }
            let calendar = Calendar.current
            let rightDate = calendar.date(for: descriptor,
                                          day: day,
                                          firstDay: date)
            self.day = calendar.component(.day, from: rightDate!)
        }
    }
    
    private var date: MeetupDate
    
    init(year: Year, month: Month) {
        date = MeetupDate(year: year, month: month)
    }
    
    func day(_ on: Day, which: Option) -> MeetupDate {
        do {
            try date.update(with: on, andOption: which)
        } catch DescriptorError.invalidDate(let date) {
            fatalError("Invalid Date: \(date)")
        } catch DescriptorError.invalidDayComponent(let day) {
            fatalError("Invalid Day Component: \(day)")
        } catch DescriptorError.notValidDescriptor(let descriptor) {
            fatalError("Invalid descriptor: \(descriptor)")
        } catch {
            fatalError("Error: \(error.localizedDescription)")
        }
        return date
    }
}

