//
//  HomeViewModel.swift
//  Travenor
//
//  Created by Saif on 15/02/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var user: User? = MockData.user
    @Published var popularTrips: [Trip]? = MockData.trips
    
    
    
}
