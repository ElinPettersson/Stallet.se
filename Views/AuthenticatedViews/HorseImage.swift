//
//  HorseImage.swift
//  Stallet.se
//
//  Created by Elin Pettersson on 2023-02-09.
//

import SwiftUI

struct HorseImage: View {
    
    @EnvironmentObject var viewModel: DatabaseConnection
    
    var horseName: String
    var horseImage: String
    var totalPercentage: Int
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: horseImage), content: {
                image in
                
                image
                    .resizable()
                    .overlay(alignment: .bottomLeading,
                             content: {
                        VStack(alignment: .leading) {
                            Text(horseName)
                                .font(.title2.lowercaseSmallCaps())
                                .foregroundColor(Color("textWhite"))
                                .shadow(color: Color(.black), radius: 2, x: 0, y: 2)
                            
                            Text(String(totalPercentage))
                                .font(.title2.lowercaseSmallCaps())
                                .foregroundColor(Color("textWhite"))
                                .shadow(color: Color(.black), radius: 2, x: 0, y: 2)
                        }
                        .padding(8)
                    })
            }, placeholder: {
                Text("Loading...").foregroundColor(.white)
                
            })
            .frame(width: 160, height: 120)
            .clipShape(Rectangle())
            .overlay(Rectangle().stroke(Color("darkPurple"), lineWidth: 8))
            .cornerRadius(2)
            .shadow(color: Color(.black), radius: 6, x: 0, y: 4)
        }
    }
}

//struct HorseImage_Previews: PreviewProvider {
//    static var previews: some View {
//        HorseImage()
//    }
//}
