//
//  ContentView.swift
//  Stallet.se
//
//  Created by Elin Pettersson on 2023-02-02.
//

import SwiftUI

final class AppModel: ObservableObject {
    enum Tab {
      case home, horses, stable
    }
    @Published var showAuthenticatedView = false
    @Published var isAuthenticated = false
    @Published var selectedTab: Tab
    
    init(
        selectedTab: Tab
    ) {
        self.selectedTab = selectedTab
    }
}

struct ContentView: View {
    
    @EnvironmentObject var dbConnection: DatabaseConnection
    @ObservedObject var appModel: AppModel
    
    
    var body: some View {
        ZStack {
            if dbConnection.isAuthenticated {
                TabView(selection: $appModel.selectedTab) {
                    
                    HomeView(appModel: .init(selectedTab: .home))
                    
                        .tabItem {
                            Image(systemName: "house")
                                .resizable().foregroundColor(.white)
                        }
                        .tag(AppModel.Tab.home)
                    AddHorseView()
                        .tabItem {
                            Image(systemName: "figure.equestrian.sports")
                                .resizable()
                        }
                        .tag(AppModel.Tab.horses)
                    
                    UserView(appModel: .init(selectedTab: .stable))
                        .tabItem {
                            Image(systemName: "person.crop.circle")
                                .resizable()
                        }
                        .tag(AppModel.Tab.stable)
                }
                .onAppear {
                    let appearance = UITabBarAppearance()
                    appearance.backgroundColor = UIColor(Color("lightPurple"))
                    appearance.stackedLayoutAppearance.normal.iconColor = UIColor(Color("normalTabbarColor"))
                    appearance.stackedLayoutAppearance.selected.iconColor = UIColor(Color("selectedTabbarColor"))
                    UITabBar.appearance().standardAppearance = appearance
                    UITabBar.appearance().scrollEdgeAppearance = appearance
                    if dbConnection.isAuthenticated {
                        print("IS AUTH")
                    }
                }
            } else {
                LoginView()
            }
        }
        .onAppear {
            if appModel.isAuthenticated {
                dbConnection.getUser(email: dbConnection.currentUser?.email ?? "", token: dbConnection.token ?? "")
            }
        }
    }
}
