//
//  CustomModifiers.swift
//  Banking
//
//  Created by Saif on 29/01/2024.
//

import Foundation
import SwiftUI



struct MaxLengthModifier : ViewModifier {
    
    let limit: Int
    @Binding var value: String
    
    func body(content: Content) -> some View {
        content.onChange(of: value) { _ in
            if value.count > limit {
                value = String(value.prefix(1))
           }
       }
    }
    
}

extension View {
    func size(_ size: CGFloat) -> some View {
        frame(width: size, height: size)
    }
    
    func width(_ w: CGFloat) -> some View {
        frame(width: w)
    }
    
    func height(_ h: CGFloat) -> some View {
        frame(height: h)
    }
    
    func maxLength(limit: Int, value: Binding<String>) -> some View {
        modifier(MaxLengthModifier(limit: limit, value: value))
    }
    
    
}

extension EdgeInsets {
    
    static func all(_ insets: CGFloat) -> EdgeInsets {
        return EdgeInsets(top: insets, leading: insets, bottom: insets, trailing: insets)
    }
    
}
