//
//  HorseListView.swift
//  Stallet.se
//
//  Created by Elin Pettersson on 2023-02-11.
//

import SwiftUI

struct HorseListItem: View {
    
    var horseName: String
    var horseImage: String
    var gender: String
    var breed: String
    
    var body: some View {
        HStack(alignment: .center) {
            
                AsyncImage(url: URL(string: horseImage),
                           content: {
                    image in
                    
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                }, placeholder: {
                    ZStack {
                        Rectangle()
                            .frame(alignment: .center)
                            .shadow(color: Color(.black), radius: 10, x: 0, y: 0)
                        
                        Text("Loading...")
                            .foregroundColor(.white)
                    }
                })
                .frame(width: 160, height: 120)
                .clipShape(Rectangle())
                .overlay(Rectangle().stroke(Color("darkPurple"), lineWidth: 8))
                .cornerRadius(2)
                .shadow(color: Color(.black), radius: 6, x: 0, y: 4)
            
            
            VStack(alignment: .leading) {
                Text(horseName)
                    .font(.title.lowercaseSmallCaps())
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .foregroundColor(Color("textWhite"))
                Text(breed)
                    .font(.title2.lowercaseSmallCaps())
                    .lineLimit(1)
                    .foregroundColor(Color("textWhite"))
                Text(gender)
                    .font(.title2.lowercaseSmallCaps())
                    .lineLimit(1)
                    .foregroundColor(Color("textWhite"))
            }
            .shadow(color: .black, radius: 2, x: 0, y: 2)
            .padding(.horizontal, 8)
            Spacer()
        }
        .padding(10)
        .frame(maxWidth: .infinity)
    }
}

struct HorseListView_Previews: PreviewProvider {

    @EnvironmentObject var dbConnection: DatabaseConnection

//    static let previewHorses: HorseList = HorseList(horseList: [Horse.init(id: "1", name: "Poffis", born: 2008, gender: "Hane", breed: "", caliber: "", type: "", color: "", strength: 1, speed: 1, endurance: 1, maintenance: 1, description: "", image: "", owner: "")])

    static var previews: some View {
        HorseListItem(horseName: "Test", horseImage: "https://www.treehugger.com/thmb/kaA2K_9wVzTbPIyCRm3-oZuy6k0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/horse.primary-e9a47e1c486c4fb7bf729e05b59cf0df.jpg", gender: "gelding", breed: "Russ")
    }
}
