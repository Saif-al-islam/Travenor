//
//  Trip.swift
//  Travenor
//
//  Created by Saif on 18/02/2024.
//

import Foundation

struct Trip: Codable, Identifiable {
    let id: Int
    let title: String
    let country: Country
    let city: City
    let description: String?
    let pricePerPersonInUS: Float
    let isAvailable: Bool
    let isFavorite: Bool
    let images: [TripImage]
    let user: User
    let comments: [TripComments]?
    let avgRate: Float
}

struct TripImage: Codable {
    let id: Int
    let path: String
    let tripMainImage: Bool
}

struct TripComments: Codable {
    let id: Int
    let rate: Float
    let comment: String
    let userId: Int
    let user: User

}
