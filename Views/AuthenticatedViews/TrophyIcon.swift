//
//  Trophy.swift
//  Stallet.se
//
//  Created by Elin Pettersson on 2023-02-09.
//

import SwiftUI

struct GoldenTrophy: View {
    var body: some View {
        VStack {
            Image(systemName: "trophy.fill")
                .foregroundColor(Color(red: 252/255, green: 194/255, blue: 0/255))
            .shadow(color: Color("black"), radius: 2, x: 0, y: 2)
        }
    }
}

struct SilverTrophy: View {
    var body: some View {
            Image(systemName: "trophy.fill")
            .foregroundColor(Color(red: 192/255, green: 192/255, blue: 192/255))
            .shadow(color: Color("black"), radius: 2, x: 0, y: 2)
    }
}

struct BronzeTrophy: View {
    var body: some View {
            Image(systemName: "trophy.fill")
            .foregroundColor(Color(red: 205/255, green: 127/255, blue: 50/255))
            .shadow(color: Color("black"), radius: 2, x: 0, y: 2)
    }
}

struct Trophy_Previews: PreviewProvider {
    static var previews: some View {
        GoldenTrophy()
    }
}
