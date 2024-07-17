//
//  TripDetailsViewModel.swift
//  Travenor
//
//  Created by Saif on 22/02/2024.
//

import Foundation
import Combine

class TripDetailsViewModel : ObservableObject {
    
    @Published var tripDetails: Trip? = MockData.trips[0]
    @Published var mainImage: String = ""
    private var subscribers = Set<AnyCancellable>()

    init() {
        $tripDetails.sink { trip in
            self.mainImage = trip?.images.first(where: { im in
                im.tripMainImage
            })?.path ?? ""
        }
        .store(in: &subscribers)
    }
    
    func getTripDetails(_ id: Int) {
        
    }
    
    func bookTrip() {
        
    }
    
    
}
