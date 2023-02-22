//
//  Stallet_seApp.swift
//  Stallet.se
//
//  Created by Elin Pettersson on 2023-02-02.
//

import SwiftUI

@main
struct Stallet_seApp: App {
    
    @StateObject var dbConnection = DatabaseConnection()
    
    var body: some Scene {
        WindowGroup {
            LoginView().environmentObject(dbConnection)
        }
    }
}
