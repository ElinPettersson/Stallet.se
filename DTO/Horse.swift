//
//  Horse.swift
//  Stallet.se
//
//  Created by Elin Pettersson on 2023-02-11.
//

import Foundation

struct Horse: Codable, Identifiable {
    var id: String
    var name: String
    var born: Int
    var gender: String
    var breed: String
    var caliber: String
    var type: String
    var color: String
    var strength: Int
    var speed: Int
    var endurance: Int
    var maintenance: Int
    var description: String
    var image: String
    var owner: String
}
