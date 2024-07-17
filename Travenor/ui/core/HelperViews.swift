//
//  HelperViews.swift
//  Banking
//
//  Created by Saif on 26/01/2024.
//

import SwiftUI

struct SpacerW: View {
    let width: CGFloat?
    
    init(_ width: CGFloat?) {
        self.width = width
    }
    
    var body: some View {
        Spacer()
            .frame(width: width)
    }
}

struct SpacerH: View {
    let height: CGFloat?
    
    init(_ height: CGFloat?) {
        self.height = height
    }
    
    var body: some View {
        Spacer()
            .frame(height: height)
    }
}

