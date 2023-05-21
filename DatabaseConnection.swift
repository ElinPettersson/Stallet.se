//
//  DatabaseConnection.swift
//  Stallet.se
//
//  Created by Elin Pettersson on 2023-02-12.
//

import Foundation
import SwiftUI

class DatabaseConnection: NSObject, ObservableObject {
    
    @Published var isAuthenticated = false
    @Published var userLoggedIn = false
    @Published var currentUser: User?
    @Published var horseInList: [Horse]?
    @Published var token: String?
    
    @State private var showAlert = false
    
    var BASE_URL = URL(string: "http://0.0.0.0:3000")!
    
    func loginUser(email: String, password: String) {
        
        //        let user = User(email: email, password: password)
        
        guard let url = URL(string:"\(BASE_URL)/login") else {
            print("error at line 31")
            return
        }
        
        print(url)
        
        let requestBody: [String: String] = [
            "email": email,
            "password": password
        ]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: requestBody) else {
            print("Failed to encode request body")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("Data is nil at line 162!!!!!!")
                print(String(describing: error))
                return
            }
            
            print(data)
            
            if let decodedResponse = try? JSONDecoder().decode(AuthResponse.self, from: data) {
                DispatchQueue.main.async {
                    // Access the decoded properties
                    print(decodedResponse.success)
                    print(decodedResponse.message)
                    print(decodedResponse.token)
                    self.cacheTokens(email: email, tokenResponse: decodedResponse)
                }
            } else {
                return
            }
        }
        task.resume()
    }
    
    func cacheTokens(email: String, tokenResponse: AuthResponse) {
        
        DispatchQueue.main.async {
            UserDefaults.standard.setValue(tokenResponse.token, forKey: Constants.accessToken)
            
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let token = tokenResponse.token
            
            do {
                let data = try encoder.encode(tokenResponse)
                if String(data: data, encoding: .utf8) != nil {
                    self.token = token
                    self.getUser(email: email, token: token)
                }
            } catch {
                return
            }
        }
        
    }
    
    func getUser(email: String, token: String) {
        
        guard let url = URL(string:"\(BASE_URL)/user/\(email)") else {
            print("error at line 31")
            return
        }
        
        print(url)
        
        var request = URLRequest(url: url)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                return
            }
            
            if let jsonString = String(data: data, encoding: .utf8) {
                print(jsonString)
            }
            
            do {
                let userResponse = try JSONDecoder().decode(User.self, from: data)
                DispatchQueue.main.async {
                    self.currentUser = userResponse
                    self.getHorses(token: token)
                    self.isAuthenticated = true
                }
            } catch {
                print("Error decoding user response: \(error.localizedDescription)")
                return
            }
        }
        task.resume()
    }
    
    func getHorses(token: String) {
        guard let url = URL(string:"\(BASE_URL)/horse") else {
            print("error at line 137")
            return
        }
        
        print(url)
        
        var request = URLRequest(url: url)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return
            }
            
            if let jsonString = String(data: data, encoding: .utf8) {
                print(jsonString)
            }
            
            do {
                let horseResponse = try JSONDecoder().decode([Horse].self, from: data)
                DispatchQueue.main.async {
                    self.horseInList = horseResponse
                }
            } catch {
                print("Error decoding horse response: \(error.localizedDescription)")
                return
            }
        }
        task.resume()
    }
    
    func RegisterUser(name: String, email: String) async {
        
        let user = User(name: name, email: email, horsesId: [])
        
        guard let url = URL(string:"\(BASE_URL)/register") else {
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
    
    func logoutUser() {
        self.isAuthenticated = false
        self.currentUser = nil
    }
    
    func addHorse(name: String, born: Int, gender: String, breed: String, caliber: String, type: String, color: String, description: String) {
        let strength: Int = 0
        let speed: Int = 0
        let endurance: Int = 0
        let maintenance: Int = 0
        let image: String = "https://source.unsplash.com/featured/?horse"
        guard let owner = currentUser?.email, !owner.isEmpty else {
            print("Error: Unauthorized or invalid owner email. Cannot add horse to another person's stable.")
            return
        }
        guard let token = self.token else {
            print("Error: No token available. Cannot authorize the request.")
            return
        }
        
        let horse = Horse(name: name, born: born, gender: gender, breed: breed, caliber: caliber, type: type, color: color, strength: strength, speed: speed, endurance: endurance, maintenance: maintenance, description: description, image: image, owner: owner)
        
        guard let url = URL(string:"\(BASE_URL)/horse") else {
            print("error at line 137")
            return
        }
        
        do {
                let jsonData = try JSONEncoder().encode(horse)
                
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
                request.httpBody = jsonData
                
                let task = URLSession.shared.dataTask(with: request) { data, response, error in
                    if let error = error {
                        print("Error: \(error.localizedDescription)")
                        return
                    }
                    
                    guard let data = data else {
                        print("Error: No data received")
                        return
                    }
                    
                    if let jsonString = String(data: data, encoding: .utf8) {
                            print("JSON Data: \(jsonString)")
                        }
                
                    if let decodedResponse = try? JSONDecoder().decode(Horse.self, from: data) {
                                    DispatchQueue.main.async {
                                        // Access the decoded properties
                                        print(decodedResponse.name)
                                        self.getHorses(token: token)
                                    }
                                } else {
                                    print("Error: Failed to decode response")
                                }
                            }
                            task.resume()
                        } catch {
                            print("Error: Failed to encode request body to JSON")
        }
    }
    
}

struct TokenResponse: Codable {
    let success: Bool?
    let message: String?
    let token: String?
}

struct Constants {
    static var accessToken = "access_token"
}
