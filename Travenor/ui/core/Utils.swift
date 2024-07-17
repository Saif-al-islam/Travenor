//
//  Utils.swift
//  Banking
//
//  Created by Saif on 29/01/2024.
//

import Foundation

class Utils {
    
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
    
     
}
