//
//  HorseImage.swift
//  Stallet.se
//
//  Created by Elin Pettersson on 2023-02-09.
//

import SwiftUI

struct HorseImage: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://i.pinimg.com/originals/1c/96/f2/1c96f2dfb525390b5b6f0a945f26203a.jpg"), content: {
            image in
        
            image.resizable().overlay(alignment: .bottomLeading, content: {
                VStack {
                    GoldenTrophy()
                }.padding()
            })
                    
            
        }, placeholder: {
            Text("Loading...").foregroundColor(.white)
            
        })
        .aspectRatio(contentMode: .fit)
        .frame(width: 100, height: 80).background(.black).cornerRadius(9)
    }
}

struct HorseImage_Previews: PreviewProvider {
    static var previews: some View {
        HorseImage()
    }
}
