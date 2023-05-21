//
//  User.swift
//  Stallet.se
//
//  Created by Elin Pettersson on 2023-02-11.
//

import Foundation

struct User: Codable {
    var name: String
    var email: String
    var horsesId: [String]
    
    enum CodingKeys: String, CodingKey {
        case name
        case email
        case horsesId = "horsesId"
    }
}

struct AuthResponse: Codable {
    let success: Bool
    let message: String
    let token: String
}
