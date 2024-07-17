//
//  PageIndicatorView.swift
//  Travenor
//
//  Created by Saif on 23/01/2024.
//

import SwiftUI

struct PageIndicatorView : View {
    @Binding var selectedPageIndex: Int
    let pageCount: Int
    
    var body: some View {
        HStack {
            ForEach(0..<pageCount, id: \.self) { index in
                Capsule()
                    .foregroundColor(.accentColor)
                    .frame(width: (selectedPageIndex == index) ? 35 : 7, height: 7)
            }
        }
    }
}


#Preview {
    PageIndicatorView(selectedPageIndex: .constant(2), pageCount: 3)
}
