//
//  stringExt.swift
//  Banking
//
//  Created by Saif on 31/01/2024.
//

import Foundation


extension String {
    
    func toDate(format: String = Utils.dateFormat)-> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
    
}
