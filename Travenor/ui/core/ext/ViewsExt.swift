//
//  ViewsExt.swift
//  Travenor
//
//  Created by Saif on 22/02/2024.
//

import Foundation
import SwiftUI

extension Text {
    
    func color(_ color: Color) -> Text {
        if #available(iOS 17.0, *) {
            return self.foregroundStyle(color)
        } else {
            return (self as (any View)).foregroundStyle(color) as! Text
        }
     }
    
//    func lines(_ maxLines: Int) -> Text {
//        return self.lineLimit(maxLines) as! Text
//    }
    
    
    
    
}

 
