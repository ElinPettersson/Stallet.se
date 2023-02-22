//
//  UserView.swift
//  Stallet.se
//
//  Created by Elin Pettersson on 2023-02-03.
//

import SwiftUI

struct UserView: View {
    
    var body: some View {
        ScrollView {
            VStack {
                Text("User View")
            }
        }
        .background(Color("lightPurple"))
        .ignoresSafeArea()
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserView()
        }
    }
}
