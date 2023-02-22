//
//  HorseView.swift
//  Stallet.se
//
//  Created by Elin Pettersson on 2023-02-03.
//

import SwiftUI

struct HorseView: View {
    
    var horse: Horse
    
    let pointRange: Double = 100.0
    
    func chartGradient() -> Gradient {
        return Gradient(colors: [Color("yellow"), Color("pink")])
    }
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: horse.image),
                       content: {
                image in
                
                image.resizable()
                
            }, placeholder: {
                ZStack {
                    Rectangle()
                        .frame(alignment: .center)
                        .shadow(color: Color(.black), radius: 10, x: 0, y: 0)
                    
                    Text("Loading...")
                        .foregroundColor(.white)
                }
            })
            .aspectRatio(contentMode: .fit)
            .clipShape(Rectangle())
            .overlay(Rectangle().stroke(Color("darkPurple"), lineWidth: 8))
            .cornerRadius(2)
            .shadow(color: Color(.black), radius: 10, x: 0, y: 4)
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
            
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
                        Text(horse.name)
                            .font(.largeTitle.lowercaseSmallCaps())
                            .foregroundColor(Color("textWhite"))
                            .shadow(color: Color(.black), radius: 2, x: 0, y: 2)
                            .padding(.vertical, 8)
                        
                        VStack {
                            HStack(alignment: .top) {
                                Text("Strenght")
                                    .frame(width: 144, alignment: .leading)
                                
                                GeometryReader { proxy in
                                    Rectangle()
                                        .fill(Color("pink"))
                                        .frame(maxWidth: 144, maxHeight: 16, alignment: .trailing)
                                        .overlay(Rectangle().stroke(Color("darkPurple"), lineWidth: 4))
                                        .cornerRadius(2)
                                        .padding(.trailing, 8)
                                    
                                }
                                
                                Text("Speed")
                                    .frame(width: 144, alignment: .leading)
                                
                                GeometryReader { proxy in
                                    Rectangle()
                                        .fill(Color("green"))
                                        .frame(maxWidth: 144, maxHeight: 16)
                                        .overlay(Rectangle().stroke(Color("darkPurple"), lineWidth: 4))
                                        .cornerRadius(2)
                                }
                            }
                                .frame(maxHeight: 40)
                                .padding(.horizontal, 16)
                            
                            HStack(alignment: .top) {
                                Text("Endurance")
                                    .frame(width: 144, alignment: .leading)
                                
                                GeometryReader { proxy in
                                    Rectangle()
                                        .fill(Color("yellow"))
                                        .frame(maxWidth: 144, maxHeight: 16)
                                        .overlay(Rectangle().stroke(Color("darkPurple"), lineWidth: 4))
                                        .cornerRadius(2)
                                }
                                Text("Maintenance")
                                    .frame(width: 144, alignment: .leading)
                                
                                GeometryReader { proxy in
                                    Rectangle()
                                        .fill(Color("textWhite"))
                                        .frame(maxWidth: 144, maxHeight: 16)
                                        .overlay(Rectangle().stroke(Color("darkPurple"), lineWidth: 4))
                                        .cornerRadius(2)
                                }
                            }
                            .frame(maxHeight: 40)
                            .padding(16)
                        }
                        .foregroundColor(Color("textWhite"))
                        .font(.headline.lowercaseSmallCaps())
                                            .padding(.bottom, 16)
                    }
                }
                .shadow(color: Color(.black), radius: 10, x: 0, y: 10)
                            .padding(.horizontal, 36)
            } else {
                
            
            ZStack {
                Rectangle()
                    .foregroundColor(Color("lightPurple"))
                    .frame(minHeight: 32)
                    .overlay(Rectangle().stroke(Color("darkPurple"), lineWidth: 8))
                    .cornerRadius(2)
                VStack {
                    Text(horse.name)
                        .font(.largeTitle.lowercaseSmallCaps())
                        .foregroundColor(Color("textWhite"))
                        .shadow(color: Color(.black), radius: 2, x: 0, y: 2)
                        .padding(.vertical, 8)
                    
                    VStack {
                        HStack(alignment: .top) {
                            Text("Strenght")
                                .frame(width: 144, alignment: .leading)
                            
                            GeometryReader { proxy in
                                Rectangle()
                                    .fill(Color("pink"))
                                    .frame(maxWidth: 144, maxHeight: 16, alignment: .trailing)
                                    .overlay(Rectangle().stroke(Color("darkPurple"), lineWidth: 4))
                                    .cornerRadius(2)
                                    .padding(.trailing, 8)
                            }
                        }
                        .padding(8)
                        
                        HStack(alignment: .top) {
                            Text("Speed")
                                .frame(width: 144, alignment: .leading)
                            
                            GeometryReader { proxy in
                                Rectangle()
                                    .fill(Color("green"))
                                    .frame(maxWidth: 144, maxHeight: 16)
                                    .overlay(Rectangle().stroke(Color("darkPurple"), lineWidth: 4))
                                    .cornerRadius(2)
                            }
                        }
                        .padding(8)
                        
                        HStack(alignment: .top) {
                            Text("Endurance")
                                .frame(width: 144, alignment: .leading)
                            
                            GeometryReader { proxy in
                                Rectangle()
                                    .fill(Color("yellow"))
                                    .frame(maxWidth: 144, maxHeight: 16)
                                    .overlay(Rectangle().stroke(Color("darkPurple"), lineWidth: 4))
                                    .cornerRadius(2)
                            }
                        }
                        .padding(8)
                        
                        HStack(alignment: .top) {
                            Text("Maintenance")
                                .frame(width: 144, alignment: .leading)
                            
                            GeometryReader { proxy in
                                Rectangle()
                                    .fill(Color("textWhite"))
                                    .frame(maxWidth: 144, maxHeight: 16)
                                    .overlay(Rectangle().stroke(Color("darkPurple"), lineWidth: 4))
                                    .cornerRadius(2)
                            }
                        }
                        .padding(8)
                    }
                    .foregroundColor(Color("textWhite"))
                    .font(.headline.lowercaseSmallCaps())
                                        .padding(.bottom, 16)
                }
            }
            .shadow(color: Color(.black), radius: 10, x: 0, y: 10)
                        .padding(.horizontal, 36)
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                
                Text(horse.description)
            }
            .foregroundColor(Color("textWhite"))
            .padding(.horizontal, 16)
            .padding(.top, 16)
            .padding(.bottom, 16)
        }
        .background(Color("lightPurple"))
    }
}

struct HorseView_Previews: PreviewProvider {
    static var previews: some View {
        HorseView(horse: Horse(id: "", name: "Isor", born: 2006, gender: "Gelding", breed: "Shetland", caliber: "", type: "", color: "", strength: 5, speed: 5, endurance: 5, maintenance: 5, description: "HEJEHHEJHEJEHEJEEHEJE HEJEHEJEH HEJEH HEJ Hej HEJEHJE JEHJEHJEH EJEIVNKNV EFHIERNVKE HEJEHHEJHEJEHEJEEHEJE HEJEHEJEH HEJEH HEJ Hej HEJEHJE JEHJEHJEH EJEIVNKNV EFHIERNVKE HEJEHHEJHEJEHEJEEHEJE HEJEHEJEH HEJEH HEJ Hej HEJEHJE JEHJEHJEH EJEIVNKNV EFHIERNVKE HEJEHHEJHEJEHEJEEHEJE HEJEHEJEH HEJEH HEJ Hej HEJEHJE JEHJEHJEH EJEIVNKNV EFHIERNVKE HEJEHHEJHEJEHEJEEHEJE HEJEHEJEH HEJEH HEJ Hej HEJEHJE JEHJEHJEH EJEIVNKNV EFHIERNVKE HEJEHHEJHEJEHEJEEHEJE HEJEHEJEH HEJEH HEJ Hej HEJEHJE JEHJEHJEH EJEIVNKNV EFHIERNVKE HEJEHHEJHEJEHEJEEHEJE HEJEHEJEH HEJEH HEJ Hej HEJEHJE JEHJEHJEH EJEIVNKNV EFHIERNVKE HEJEHHEJHEJEHEJEEHEJE HEJEHEJEH HEJEH HEJ Hej HEJEHJE JEHJEHJEH EJEIVNKNV EFHIERNVKE HEJEHHEJHEJEHEJEEHEJE HEJEHEJEH HEJEH HEJ Hej HEJEHJE JEHJEHJEH EJEIVNKNV EFHIERNVKE HEJEHHEJHEJEHEJEEHEJE HEJEHEJEH HEJEH HEJ Hej HEJEHJE JEHJEHJEH EJEIVNKNV EFHIERNVKE HEJEHHEJHEJEHEJEEHEJE HEJEHEJEH HEJEH HEJ Hej HEJEHJE JEHJEHJEH EJEIVNKNV EFHIERNVKE HEJEHHEJHEJEHEJEEHEJE HEJEHEJEH HEJEH HEJ Hej HEJEHJE JEHJEHJEH EJEIVNKNV EFHIERNVKE ", image: "https://i.pinimg.com/originals/1c/96/f2/1c96f2dfb525390b5b6f0a945f26203a.jpg", owner: ""))
    }
}
