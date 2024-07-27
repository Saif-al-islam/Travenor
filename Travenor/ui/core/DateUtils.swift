//
//  Utils.swift
//  Banking
//
//  Created by Saif on 29/01/2024.
//

import Foundation

class DateUtils {
    
    static let dateFormat = "dd MMM yyyy"
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter
    }()
    
    static func isDatesEqual(date1: Date, date2: Date) -> Bool {
        return Calendar.current.compare(date1, to: date2, toGranularity: .day) == .orderedSame
    }
    
    static func isDatesAfterFst(date1: Date, date2: Date) -> Bool {
        return Calendar.current.compare(date1, to: date2, toGranularity: .day) == .orderedAscending
    }
    
    static func getDaysCount(in month: Int, of year: Int) -> Int {
        let comp = DateComponents(year: year, month: month)
        let calendar = Calendar.current
        let date = calendar.date(from: comp)
        let range = calendar.range(of: .day, in: .month, for: date!)
        return range?.count ?? 0
    }
    
    static func getDayName(dayInMonth day: Int, month: Int, year: Int) -> String {
        let comp = DateComponents(year: year, month: month, day: day)
        let calendar = Calendar.current
        let date = calendar.date(from: comp)
        let weekDay = calendar.component(.weekday, from: date!)
        return switch weekDay {
        case 1:
            "Sunday"
        case 2:
            "Monday"
        case 3:
            "Tuesday"
        case 4:
            "wednesday"
        case 5:
            "Thuday"
        case 6:
            "Friday"
        case 7:
            "Satday"
        default:
            ""
        }
    }
    
    
    static func getMonthName(_ month: Int) -> String {
        return switch month {
        case 1: "January"
        case 2: "February"
        case 3: "March"
        case 4: "April"
        case 5: "May"
        case 6: "June"
        case 7: "July"
        case 8: "August"
        case 9: "September"
        case 10: "October"
        case 11: "November"
        case 12: "December"
        default: ""
        }
    }
    
    
}
