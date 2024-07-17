//
//  MockData.swift
//  Travenor
//
//  Created by Saif on 15/02/2024.
//

import Foundation

class MockData {
    
    static let user = User(fName: "saif", lName: "islam", email: "saif@gmail.com", phone: "013213003912", image: "ic_user", location: "Egypt, Cairo", isOnline: true)
    
    static let users = [
        User(fName: "saif", lName: "islam", email: "saif@gmail.com", phone: "013213003912", image: "ic_user", location: "Egypt, Cairo", isOnline: true),
        User(fName: "ahmed", lName: "mahmoud", email: "ahmed@gmail.com", phone: "98098120309", image: "ic_user", location: "Egypt, Bani-suef", isOnline: true),
        User(fName: "yousif", lName: "abd-elhakim", email: "yousif@gmail.com", phone: "2139891012390", image: nil, location: "Spain, madrid", isOnline: false),
        User(fName: "moatz", lName: "ashraf", email: "moatz@gmail.com", phone: "83901283", image: "ic_user", location: "Mexico, mexico city", isOnline: false)
    ]
    
    static let countries = [
        Country(id: 1, name: "Egypt"),
        Country(id: 2, name: "France"),
        Country(id: 3, name: "Mexico"),
        Country(id: 4, name: "US"),
        Country(id: 5, name: "Turkya"),
        Country(id: 6, name: "Spain")
    ]
    
    static let cities = [
        City(id: 1, name: "Cairo", countryId: 1),
        City(id: 1, name: "Washenton", countryId: 4),
        City(id: 1, name: "Istanbol", countryId: 5),
        City(id: 1, name: "Madrid", countryId: 6),
        City(id: 1, name: "Mexico City", countryId: 3),
        City(id: 1, name: "Paris", countryId: 2)
    ]
    
    static let tripImages = [
        TripImage(id: 1, path: "im-onboarding-1", tripMainImage: false),
        TripImage(id: 2, path: "im-onboarding-2", tripMainImage: false),
        TripImage(id: 3, path: "im-onboarding-3", tripMainImage: true),
        TripImage(id: 4, path: "im-onboarding-1", tripMainImage: false),
        TripImage(id: 5, path: "im-onboarding-2", tripMainImage: false),
        TripImage(id: 6, path: "im-onboarding-3", tripMainImage: false),
        TripImage(id: 7, path: "im-onboarding-1", tripMainImage: false),
        TripImage(id: 8, path: "im-onboarding-2", tripMainImage: false),
        TripImage(id: 9, path: "im-onboarding-3", tripMainImage: false)
    ]
    
    static let tripComments = [
        TripComments(id: 1, rate: 4.5, comment: "Well this is great place", userId: 1, user: users[0]),
        TripComments(id: 2, rate: 2.2, comment: "bad place", userId: 2, user: users[1]),
        TripComments(id: 3, rate: 4, comment: "alskjdaj jadlk j;aljdl", userId: 3, user: users[2]),
        TripComments(id: 4, rate: 5, comment: "Perfect place", userId: 4, user: users[3])
    ]
    
    static let trips = [
        Trip(id: 1, title: "Niladri Reservoir", country: countries[0], city: cities[0],
             description: "You will get a complete travel package on the beaches. Packages in the form of airline tickets, recommended Hotel rooms, Transportation, Have you ever been on holiday to the Greek ETC.",
             pricePerPersonInUS: 59,
             isAvailable: true,
             isFavorite: false,
             images: tripImages,
             user: user,
             comments: tripComments,
             avgRate: 4.4),
        
        Trip(id: 2, title: "Niladri Reservoir", country: countries[0], city: cities[0],
             description: "You will get a complete travel package on the beaches. Packages in the form of airline tickets, recommended Hotel rooms, Transportation, Have you ever been on holiday to the Greek ETC.",
             pricePerPersonInUS: 59,
             isAvailable: true,
             isFavorite: false,
             images: tripImages,
             user: user,
             comments: tripComments,
             avgRate: 4.4)
    ]
    
    
}
