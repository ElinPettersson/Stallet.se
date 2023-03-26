//
//  UserView.swift
//  Stallet.se
//
//  Created by Elin Pettersson on 2023-02-03.
//

import SwiftUI

struct UserView: View {
    
    @State var user: User
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("\(user.email)s stable")
                .font(.largeTitle.lowercaseSmallCaps())
                .foregroundColor(Color("textWhite"))
                .shadow(color: Color(.black), radius: 2, x: 0, y: 2)
                .padding(.top, 44)
            
            
            ScrollView {
                 Text("Horse list")
                    .font(.largeTitle.lowercaseSmallCaps())
                    .foregroundColor(Color("textWhite"))
                    .shadow(color: Color(.black), radius: 2, x: 0, y: 2)
                    .padding(.vertical, 8)
            }
            .foregroundColor(Color("white"))
            .frame(maxWidth: .infinity)
            .padding(16)
            Spacer()
        }
        .background(Color("lightPurple"))
        .ignoresSafeArea()
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserView(user: User(name: "Elin", email: "elin@test.se", password: "AIK"))
        }
    }
}
