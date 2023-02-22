//
//  User.swift
//  Stallet.se
//
//  Created by Elin Pettersson on 2023-02-11.
//

import Foundation

struct User: Codable, Identifiable {
    var id: String?
    var name: String?
    var email: String
    var password: String
    var horseIds: [Horse]?
}
