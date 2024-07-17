//
//  BaseResponse.swift
//  Travenor
//
//  Created by Saif on 19/02/2024.
//

import Foundation

protocol BaseResponse {
    var status: Int { get }
    var msg: String? { get }

}
