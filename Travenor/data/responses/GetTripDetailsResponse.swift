//
//  GetTripDetailsResponse.swift
//  Travenor
//
//  Created by Saif on 19/02/2024.
//

import Foundation

struct GetTripDetailsResponse : BaseResponse, Codable {
    var status: Int = 0
    var msg: String? = nil
    
    let data: Trip?
}
