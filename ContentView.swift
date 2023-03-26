//
//  ContentView.swift
//  Stallet.se
//
//  Created by Elin Pettersson on 2023-02-02.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var dbConnection: DatabaseConnection
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                        .resizable()
                }
            HorseView(horse: Horse(id: "", name: "Hoffa", born: 2006, gender: "", breed: "", caliber: "", type: "", color: "", strength: 5, speed: 5, endurance: 5, maintenance: 5, description: "HEJEHHEJHEJEHEJEEHEJE HEJEHEJEH HEJEH HEJ Hej HEJEHJE JEHJEHJEH EJEIVNKNV EFHIERNVKE HEJEHHEJHEJEHEJEEHEJE HEJEHEJEH HEJEH HEJ Hej HEJEHJE JEHJEHJEH EJEIVNKNV EFHIERNVKE HEJEHHEJHEJEHEJEEHEJE HEJEHEJEH HEJEH HEJ Hej HEJEHJE JEHJEHJEH EJEIVNKNV EFHIERNVKE HEJEHHEJHEJEHEJEEHEJE HEJEHEJEH HEJEH HEJ Hej HEJEHJE JEHJEHJEH EJEIVNKNV EFHIERNVKE HEJEHHEJHEJEHEJEEHEJE HEJEHEJEH HEJEH HEJ Hej HEJEHJE JEHJEHJEH EJEIVNKNV EFHIERNVKE HEJEHHEJHEJEHEJEEHEJE HEJEHEJEH HEJEH HEJ Hej HEJEHJE JEHJEHJEH EJEIVNKNV EFHIERNVKE HEJEHHEJHEJEHEJEEHEJE HEJEHEJEH HEJEH HEJ Hej HEJEHJE JEHJEHJEH EJEIVNKNV EFHIERNVKE HEJEHHEJHEJEHEJEEHEJE HEJEHEJEH HEJEH HEJ Hej HEJEHJE JEHJEHJEH EJEIVNKNV EFHIERNVKE HEJEHHEJHEJEHEJEEHEJE HEJEHEJEH HEJEH HEJ Hej HEJEHJE JEHJEHJEH EJEIVNKNV EFHIERNVKE HEJEHHEJHEJEHEJEEHEJE HEJEHEJEH", image: "https://i.pinimg.com/originals/1c/96/f2/1c96f2dfb525390b5b6f0a945f26203a.jpg", owner: ""))
                .tabItem {
                    Image(systemName: "figure.equestrian.sports")
                        .resizable()
                }
            
            UserView(user: User(name: "Elin", email: "elin@test.se", password: "AIK"))
                .tabItem {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                }
        }
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.backgroundColor = UIColor(Color("lightPurple"))
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}

