//
//  LoginView.swift
//  Stallet.se
//
//  Created by Elin Pettersson on 2023-02-02.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var dbConnection: DatabaseConnection
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Stallet.se")
                    .font(.largeTitle)
                    .foregroundColor(Color("textWhite"))
                    .shadow(color: Color("black"), radius: 2, x: 0, y: 2)
                    .padding(.bottom, 48)
                
                VStack(alignment: .leading) {
                    Text("Email")
                        .foregroundColor(.white)
                    TextField("", text: $email)
                        .disableAutocorrection(true)
                        .padding(.bottom, 8)
                    
                    Text("Password")
                        .foregroundColor(Color("textWhite"))
                    TextField("", text: $password)
                        .disableAutocorrection(true)
                }
                .padding(.horizontal, 32)
                .padding(.bottom, 32)
                
                Button(action: {
                    print("Login button is pressed")
                    if email == "", password == "" {
                        print("Fields are empty")
                    } else {
                        dbConnection.LoginUser(email: email, password: password)
                    }
                }, label: {
                    Text("Sign in")
                        .frame(width: 160)
                        .foregroundColor(Color("textWhite"))
                })
                .tint(Color("darkPurple"))
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .padding(.bottom, 8)
                
                NavigationLink(destination: {
                    RegisterView()
                }, label: {
                    Text("Sign up")
                        .foregroundColor(Color("white"))
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
            .shadow(color: Color("black"), radius: 2, x: 0, y: 2)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
