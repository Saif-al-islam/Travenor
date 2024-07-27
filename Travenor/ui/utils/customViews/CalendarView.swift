//
//  CalendarView.swift
//  Travenor
//
//  Created by Saif on 22/07/2024.
//

import SwiftUI

struct CalendarView: View {
    @Binding var year: Int
    @Binding var month: Int
    @Binding var day: Int
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CalendarView(year: , month: 1, day: 1)
}
