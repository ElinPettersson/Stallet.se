//
//  HorseView.swift
//  Stallet.se
//
//  Created by Elin Pettersson on 2023-02-03.
//

import SwiftUI

struct HorseView: View {
    
    @EnvironmentObject var db: DatabaseConnection
    var selectedHorse: Horse
    
    let frameWidth: CGFloat = 144
    let frameHeight: CGFloat = 16
    
    func chartGradient() -> Gradient {
        return Gradient(colors: [Color("yellow"), Color("pink")])
    }
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            AsyncImage(url: URL(string: selectedHorse.image ?? "https://source.unsplash.com/featured/?horse"),
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
                .frame(width: 320, height: 240)
                .clipShape(Rectangle())
                .overlay(Rectangle().stroke(Color("darkPurple"), lineWidth: 8))
                .cornerRadius(2)
                .shadow(color: Color(.black), radius: 6, x: 0, y: 4)
                .padding(16)
            
            Text(selectedHorse.name)
                .font(.largeTitle.lowercaseSmallCaps())
                .foregroundColor(Color("textWhite"))
                .shadow(color: Color(.black), radius: 2, x: 0, y: 2)
                .padding(.vertical, 8)
            
            if UIDevice.current.userInterfaceIdiom == .pad {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("lightPurple"))
                        .frame(minHeight: 32, maxHeight: 184)
                        .overlay(Rectangle().stroke(Color("darkPurple"), lineWidth: 8))
                        .cornerRadius(2)
                        .padding(.top, 16)
                        .padding(.bottom, 40)
                        
                        VStack {
                            HStack(alignment: .top) {
                                Text("Strenght")
                                    .frame(width: 144, alignment: .leading)
                                HorseValue(value: selectedHorse.strength, foregroundColor: Color("pink"))
                                
                                Text("Speed")
                                    .frame(width: 144, alignment: .leading)
                                HorseValue(value: selectedHorse.speed, foregroundColor: Color("green"))
                            }
                            .frame(maxHeight: 40)
                            .padding(.horizontal, 16)
                            
                            HStack(alignment: .top) {
                                Text("Endurance")
                                    .frame(width: 144, alignment: .leading)
                                HorseValue(value: selectedHorse.endurance, foregroundColor: Color("yellow"))
                                
                                Text("Maintenance")
                                    .frame(width: 144, alignment: .leading)
                                HorseValue(value: selectedHorse.maintenance, foregroundColor: Color("textWhite"))
                            }
                            .frame(maxHeight: 40)
                            .padding(16)
                        }
                        .foregroundColor(Color("textWhite"))
                        .font(.headline.lowercaseSmallCaps())
                        .padding(.bottom, 16)
                    
                }
                .shadow(color: Color(.black), radius: 10, x: 0, y: 10)
                .padding(.horizontal, 36)
            } else {
                    
//                    Rectangle()
//                        .foregroundColor(Color("lightPurple"))
//                        .frame(width: 320, height: 200)
//                        .overlay(Rectangle().stroke(Color("darkPurple"), lineWidth: 8))
//                        .cornerRadius(2)
                        
                        VStack {
                            HStack(alignment: .top) {
                                Text("Strenght")
                                    .frame(width: 144, alignment: .leading)
                                
                                HorseValue(value: selectedHorse.strength, foregroundColor: Color("pink"))
                            }
                            .padding(8)
                            
                            HStack(alignment: .top) {
                                Text("Speed")
                                    .frame(width: 144, alignment: .leading)
                                
                                HorseValue(value: selectedHorse.speed, foregroundColor: Color("green"))
                                
                            }
                            .padding(8)
                            
                            HStack(alignment: .top) {
                                Text("Endurance")
                                    .frame(width: 144, alignment: .leading)
                                
                                HorseValue(value: selectedHorse.endurance, foregroundColor: Color("yellow"))
                            }
                            .padding(8)
                            
                            HStack(alignment: .top) {
                                Text("Maintenance")
                                    .frame(width: 144, alignment: .leading)
                                
                                HorseValue(value: selectedHorse.maintenance, foregroundColor: Color("textWhite"))
                            }
                            .padding(8)
                    }
                    .foregroundColor(Color("textWhite"))
                    .font(.headline.lowercaseSmallCaps())
                    .frame(width: 320)
                    .clipShape(Rectangle())
                    .overlay(Rectangle().stroke(Color("darkPurple"), lineWidth: 8))
                    .cornerRadius(2)
                    .shadow(color: Color(.black), radius: 6, x: 0, y: 4)
            }
            
            Text(selectedHorse.description)
                .padding(.vertical, 16)
        }
        .frame(maxWidth: .infinity)
        .foregroundColor(Color("textWhite"))
        .padding(.horizontal, 16)
        .padding(.top, 16)
        .padding(.bottom, 16)
        .background(Color("lightPurple"))
    }
}
    


