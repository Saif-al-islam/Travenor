//
//  User.swift
//  Travenor
//
//  Created by Saif on 15/02/2024.
//

import Foundation

struct User: Codable {
    let fName: String
    let lName: String
    let email: String
    let phone: String
    let image: String?
    let location: String
    let isOnline: Bool
}
