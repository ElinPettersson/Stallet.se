//
//  RegisterView.swift
//  Stallet.se
//
//  Created by Elin Pettersson on 2023-02-02.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var dbConnection: DatabaseConnection
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            Text("Stallet.se")
                .font(.largeTitle)
                .foregroundColor(Color("textWhite"))
                .shadow(color: Color("black"), radius: 2, x: 0, y: 2)
                .padding(.bottom, 32)
            
            Text("Register an account")
                .font(.headline)
                .foregroundColor(Color("textWhite"))
                .padding(.bottom, 32)
            
            VStack(alignment: .leading) {
                Text("Email")
                    .foregroundColor(.white)
                TextField("", text: $email)
                    .disableAutocorrection(true)
                    .padding(.bottom, 8)
                
                Text("Password")
                    .foregroundColor(.white)
                TextField("", text: $password)
                    .disableAutocorrection(true)
                    .padding(.bottom, 8)
                
                Text("Repeat password")
                    .foregroundColor(.white)
                TextField("", text: $password)
                    .disableAutocorrection(true)
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 32)
            
            Button(action: {
                print("Register button is pressed")
            }, label: {
                Text("Register")
                    .frame(width: 160)
            })
            .tint(Color("darkPurple"))
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            
            Spacer()
        }
        .background(Color("lightPurple"))
        .textFieldStyle(.roundedBorder)
        .ignoresSafeArea()
        .shadow(color: .black, radius: 2, x: 0, y: 2)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
