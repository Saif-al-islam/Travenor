//
//  CalendarTabView.swift
//  Travenor
//
//  Created by Saif on 15/02/2024.
//

import SwiftUI

struct CalendarTabItemView: View {
    var body: some View {
        VStack {
            
            
            
        }
        .ignoresSafeArea()
        .baseToolBar(title: "schedule") {
            Image(systemName: "bell")
                .size(44)
                .background(Circle().fill(.gray.opacity(0.16)))
        }
        .onAppear {
            
        }
    }
}

#Preview {
    CalendarTabItemView()
}
