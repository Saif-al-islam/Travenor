//
//  HomeView.swift
//  Travenor
//
//  Created by Saif on 23/01/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            HomeTabItemView()
                .tabItem {
                    Label("home", image: "ic_home")
                }
            
            CalendarTabItemView()
                .tabItem {
                    Label("calendar", image: "ic_calendar")
                }
            
            MessagesTabItemView()
                .tabItem {
                    Label("messages", image: "ic_message")
                }
            
            ProfileTabItemView()
                .tabItem {
                    Label("profile", image: "ic_profile")
                }
            
            
        }
    }
}

#Preview {
    HomeView()
}
