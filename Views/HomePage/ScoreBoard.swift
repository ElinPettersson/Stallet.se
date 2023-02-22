//
//  ScoreBoard.swift
//  Stallet.se
//
//  Created by Elin Pettersson on 2023-02-09.
//

import SwiftUI

struct ScoreBoard: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("darkPurple"))
                .frame(width: 320, height: 160)
                .cornerRadius(7)
            
            HStack {
                HorseImage()
                
                HorseImage()
                
                HorseImage()
            }
        }
    }
}

struct ScoreBoard_Previews: PreviewProvider {
    static var previews: some View {
        ScoreBoard()
    }
}
