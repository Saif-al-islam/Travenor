//
//  GetTripsResponse.swift
//  Travenor
//
//  Created by Saif on 19/02/2024.
//

import Foundation

struct GetTripsResponse : BaseResponse, Codable {
    var status: Int = 0
    var msg: String? = nil
    
    let data: [Trip]?
    
    
//    struct Trip: Codable {
//        let id: Int
//        let title: String
//        let country: Country
//        let city: City
//        let mainImage: TripImage
//        let totalRate: Float
//        let isFavorite: Bool
//        let commentsNum: Int
//        let topComments: [TripComments]
//    }
}
