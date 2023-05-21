//
//  Horse.swift
//  Stallet.se
//
//  Created by Elin Pettersson on 2023-02-11.
//

import Foundation

struct Horse: Codable, Identifiable, Hashable {
    var id: String?
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
    var image: String?
    var owner: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case born
        case gender
        case breed
        case caliber
        case type
        case color
        case strength
        case speed
        case endurance
        case maintenance
        case description
        case image = "picture"
        case owner
    }
    
    var totalPercentage: Int {
            // Calculate the total percentage based on strength, speed, endurance, and maintenance
        return (strength + speed + endurance + maintenance) / 4
        }

        static func < (lhs: Horse, rhs: Horse) -> Bool {
            // Define the sorting order based on total percentage (best to worst)
            return lhs.totalPercentage > rhs.totalPercentage
        }
}

struct HorseList: Codable {
    var horseList: [Horse]
    func loadList() async {}
}
