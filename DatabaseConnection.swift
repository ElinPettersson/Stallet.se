//
//  DatabaseConnection.swift
//  Stallet.se
//
//  Created by Elin Pettersson on 2023-02-12.
//

import Foundation
import SwiftUI

class DatabaseConnection: ObservableObject {
    
    @Published var userLoggedIn = false
    @Published var currentUser: User?
    
    var BASE_URL = URL(string: "http://0.0.0.0:3000")!
    
    func LoginUser(email: String, password: String) {
        
        let user = User(email: email, password: password)
        
        guard let url = URL(string:"\(BASE_URL)/login") else {
            print("error at line 31")
            return
        }
        var request = URLRequest(url: url)
        print(request)
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? encoder.encode(user) else {
            print("Couldnt encode request body")
            return
        }
        request.httpBody = httpBody
        request.timeoutInterval = 20
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
}

func RegisterUser(name: String, email: String, password: String) {
}
