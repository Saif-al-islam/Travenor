//
//  FontExt.swift
//  Travenor
//
//  Created by Saif on 18/02/2024.
//

import SwiftUI

extension Font {
    
    private static func myFont(_ name: String, size: CGFloat, relativeTo textStyle: Font.TextStyle? = nil) -> Font {
        return textStyle == nil ? Font.custom(name, size: size) : Font.custom(name, size: size, relativeTo: textStyle!)
    }
    
    static func font_SfUiDisplayBlack(size: CGFloat, relativeTo textStyle: Font.TextStyle? = nil) -> Font {
        return myFont("sf-ui-display-black", size: size, relativeTo: textStyle)
    }
    
    static func font_SfUiDisplayBold(size: CGFloat, relativeTo textStyle: Font.TextStyle? = nil) -> Font {
        return myFont("sf-ui-display-bold", size: size, relativeTo: textStyle)
    }
    
    static func font_SfUiDisplayLight(size: CGFloat, relativeTo textStyle: Font.TextStyle? = nil) -> Font {
        return myFont("sf-ui-display-light", size: size, relativeTo: textStyle)
    }
    
    static func font_SfUiDisplaySemiBold(size: CGFloat, relativeTo textStyle: Font.TextStyle? = nil) -> Font {
        return myFont("sf-ui-display-semibold", size: size, relativeTo: textStyle)
    }
    
    static func font_SfUiDisplayMedium(size: CGFloat, relativeTo textStyle: Font.TextStyle = .footnote) -> Font {
        return myFont("sf-ui-display-medium", size: size, relativeTo: textStyle)
    }
    
    static func font_GillSansMt(size: CGFloat, relativeTo textStyle: Font.TextStyle? = nil) -> Font {
        return myFont("gill-sans-mt", size: size, relativeTo: textStyle)
     }
    
    static func font_GeometricBlack(size: CGFloat, relativeTo textStyle: Font.TextStyle? = nil) -> Font {
        return myFont("Geometric415BT-BlackA", size: size, relativeTo: textStyle)
    }
    
    
}
