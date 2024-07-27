//
//  CalendarView.swift
//  Travenor
//
//  Created by Saif on 22/07/2024.
//

import SwiftUI
import Combine

struct CalendarView: View {
    @Binding var selectedYear: Int
    @Binding var selectedMonth: Int
    @Binding var selectedDayOfMonth: Int
    var bgCornerSize: CGSize
    var selectedItemCornerSize: CGSize
    var bgColor: Color
    var selectedItemColor: Color
    
    //////////////////////      //////////////////////
    @State private var currentMonth : Int
    @State private var currentYear: Int
    @State private var daysCountInMonth: Int = 0
    @State private var currentWeek: ClosedRange<Int> = 1...7
    
    init(selectedYear: Binding<Int>, selectedMonth: Binding<Int>, selectedDayOfMonth: Binding<Int>, bgCornerSize: CGSize = CGSize(width: 20, height: 20), selectedItemCornerSize: CGSize = CGSize(width: 10, height: 10), bgColor: Color = .white, selectedItemColor: Color = .blue) {
        self._selectedYear = selectedYear
        self._selectedMonth = selectedMonth
        self._selectedDayOfMonth = selectedDayOfMonth
        self.bgCornerSize = bgCornerSize
        self.selectedItemCornerSize = selectedItemCornerSize
        self.bgColor = bgColor
        self.selectedItemColor = selectedItemColor
        
        currentYear = selectedYear.wrappedValue
        currentMonth = selectedMonth.wrappedValue
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("\(selectedDayOfMonth) \(DateUtils.getMonthName(selectedMonth)) \(String(selectedYear))")
                    .font(.font_SfUiDisplayBold(size: 20, relativeTo: .title))
                    .foregroundStyle(.colorBlack1)
                
                Spacer()
                
                Image(systemName: "chevron.backward")
                    .padding(4)
                    .onTapGesture {
                        onPrevClick()
                    }
                
                Spacer()
                    .frame(width: 12)
                
                Image(systemName: "chevron.forward")
                    .padding(4)
                    .onTapGesture {
                        onNextClick()
                    }
            }
            
            Text("\(DateUtils.getMonthName(currentMonth)) \(String(currentYear))")
                .font(.font_SfUiDisplaySemiBold(size: 14, relativeTo: .subheadline))
                .foregroundStyle(.grayColor1)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
                .frame(height: 22)
            
            HStack {
                ForEach(currentWeek, id: \.self) { day in
                    VStack {
                        Text(DateUtils.getDayName(dayInMonth: day, month: currentMonth, year: currentYear)[0..<3])
                            .font(.font_SfUiDisplayMedium(size: 15, relativeTo: .body))
                            .foregroundStyle((selectedDayOfMonth == day && selectedMonth == currentMonth) ?
                                .white : .grayColor1)
                        
                        Spacer()
                            .frame(height: 12)
                        
                        Text("\(day)")
                            .font(.font_SfUiDisplaySemiBold(size: 16, relativeTo: .body))
                            .foregroundStyle((selectedDayOfMonth == day && selectedMonth == currentMonth) ? .white : .colorBlack1)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .conditional(selectedDayOfMonth == day && selectedMonth == currentMonth, trueCase: { v in
                        v.background(
                            RoundedRectangle(
                                cornerSize: selectedItemCornerSize
                            ).fill(selectedItemColor)
                        )
                    })
                    .onTapGesture {
                        selectedDayOfMonth = day
                        selectedMonth = currentMonth
                        selectedYear = currentYear
                    }
                    
                }
            }
            .frame(maxWidth: .infinity)
            
        }
        .padding(18)
        .background(RoundedRectangle(cornerSize: bgCornerSize).fill(bgColor))
        .shadow(radius: bgCornerSize.width)
        .onReceive(Just(currentMonth), perform: { _ in
            daysCountInMonth = DateUtils.getDaysCount(in: currentMonth, of: currentYear)
            print("update val= \(daysCountInMonth)")
        })
        .onReceive(Just(currentYear), perform: { _ in
            daysCountInMonth = DateUtils.getDaysCount(in: currentMonth, of: currentYear)
        })
    }
    
    private func onPrevClick() {
        if currentWeek.lowerBound == 1 && currentMonth == 1 { // first month and first day in month.
            return
        } else if currentWeek.lowerBound == 1 && currentMonth > 1 {
            currentMonth -= 1
//            daysCountInMonth = DateUtils.getDaysCount(in: currentMonth, of: currentYear)
            currentWeek = (daysCountInMonth - 6)...daysCountInMonth
            print(daysCountInMonth)
            return
        }
        
        let lowerBound = if currentWeek.lowerBound - 7 < 1 {
            1
        } else {
            currentWeek.lowerBound - 7
        }
        
        currentWeek = lowerBound...(lowerBound + 6)
    }
    
    private func onNextClick() {
        if currentMonth == 12 && currentWeek.upperBound == daysCountInMonth { // last month and last day in month.
            return
        } else if currentMonth < 12 && currentWeek.upperBound == daysCountInMonth {
            currentMonth += 1
            currentWeek = 1...7
            return
        }
        
        let upperBound = if currentWeek.upperBound + 7 > daysCountInMonth {
            daysCountInMonth
        }
        else {
            currentWeek.upperBound + 7
        }
        
        currentWeek = (upperBound - 6)...upperBound
    }
    
    
}

#Preview {
    struct PreviewWrapper: View {
        @State var day: Int = 1
        @State var month: Int = 2
        @State var year: Int = 2024
        
        var body: some View {
            CalendarView(selectedYear: $year, selectedMonth: $month, selectedDayOfMonth: $day)
        }
    }
    return PreviewWrapper()
}
