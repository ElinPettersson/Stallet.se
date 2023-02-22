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
    
    var BASE_URL = URL(string: "http://192.168.0.24:3000")!
    
    func LoginUser(username: String, password: String) {
        
        let user = User(email: username, password: password)
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        let data = try! encoder.encode(user)
        print(String(data: data, encoding: .utf8)!)
        
        let jsonData = try? JSONSerialization.data(withJSONObject: data)
        
        guard let url = URL(string:"\(BASE_URL)/login") else {
            return
        }
        
//        var request = URLRequest(url: url, timeoutInterval: .infinity)
//
//        print("Starting fetch")
//
//        request.httpMethod = "POST"
//        request.httpBody = jsonData
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//
//            print("Fetch Data function \(String(describing: error?.localizedDescription))")
//            guard let data = data, error == nil else {
//                print(String(describing: error))
//                return
//            }
//            let decodedResponse = try? JSONSerialization.jsonObject(with: data, options: [])
//            if let decodedResponse = decodedResponse as? [String: Any] {
//                print(decodedResponse)
//            } else {
//                print("Could not decode at line 52")
//            }
//        }
//        task.resume()
    }
}
