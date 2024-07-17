//
//  TravenorApp.swift
//  Travenor
//
//  Created by Saif on 21/01/2024.
//

import SwiftUI

@main
struct TravenorApp: App {
    
    @ObservedObject var router = Router()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                SplashView()
//                TripDetailsView(tripId: 1)
                    .navigationDestination(for: NavDestination.self) { dest in
                        navToDestinationView(to: dest)
                    }
            }
            .environmentObject(router)
        }
    }
}
