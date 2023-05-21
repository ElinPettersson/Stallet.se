//
//  HorseActivity.swift
//  Stallet.se
//
//  Created by Elin Pettersson on 2023-05-18.
//

import SwiftUI

struct HorseActivity: View {
    
    @EnvironmentObject var db: DatabaseConnection
    
    var horse: Horse
    
    let valueRange = CGFloat(100)
    
    var body: some View {
        if let horseList = db.horseInList {
            ForEach(horseList) { horse in
            GeometryReader { geometry in
                VStack {
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .frame(width: geometry.size.width, height: 10)
                            .foregroundColor(Color.gray)
                        
                        Rectangle()
                            .frame(width: CGFloat(horse.strength) / 100 * geometry.size.width, height: 10) // Adjust the height as needed
                            .foregroundColor(Color("darkPurple")) // Set the fill color based on speed
                    }
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .frame(width: geometry.size.width, height: 10)
                            .foregroundColor(Color.gray)
                        
                        Rectangle()
                            .frame(width: CGFloat(horse.speed) / 100 * geometry.size.width, height: 10) // Adjust the height as needed
                            .foregroundColor(Color("darkPurple")) // Set the fill color based on speed
                    }
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .frame(width: geometry.size.width, height: 10)
                            .foregroundColor(Color.gray)
                        
                        Rectangle()
                            .frame(width: CGFloat(horse.endurance) / 100 * geometry.size.width, height: 10) // Adjust the height as needed
                            .foregroundColor(Color("darkPurple")) // Set the fill color based on speed
                    }
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .frame(width: geometry.size.width, height: 10)
                            .foregroundColor(Color.gray)
                        
                        Rectangle()
                            .frame(width: CGFloat(horse.maintenance) / 100 * geometry.size.width, height: 10) // Adjust the height as needed
                            .foregroundColor(Color("darkPurple")) // Set the fill color based on speed
                    }
                }
                }
            }
        }
    }
}


struct HorseValue: View {
//    @EnvironmentObject var db: DatabaseConnection
    var value: Int // Assuming horseSpeed is a value between 0 and 100
    var foregroundColor: Color
    
    var body: some View {
        
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .frame(width: geometry.size.width, height: 12)
                            .foregroundColor(Color("lightPurple"))
                            .overlay(Rectangle().stroke(Color("darkPurple"), lineWidth: 2))
                        
                        Rectangle()
                            .frame(width: CGFloat(value) / 100 * geometry.size.width, height: 10)
                            .foregroundColor(foregroundColor)
                    }
        }
    }
}

//struct HorseActivity_Previews: PreviewProvider {
//    static var previews: some View {
//        HorseActivity(horse: .init(id: "1", name: "Test", born: 2008, gender: "mare", breed: "pony", caliber: "coldblood", type: "Pony", color: "brown", strength: 20, speed: 40, endurance: 50, maintenance: 70, description: "Test", owner: "elin@aik.se"))
//    }
//}


