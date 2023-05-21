//
//  HomeView.swift
//  Stallet.se
//
//  Created by Elin Pettersson on 2023-02-03.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var db: DatabaseConnection
    @ObservedObject var appModel: AppModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Score board")
                        .font(.largeTitle.lowercaseSmallCaps())
                        .foregroundColor(Color("textWhite"))
                        .shadow(color: Color(.black), radius: 2, x: 0, y: 2)
                        .padding(.vertical, 8)
                    
                    if let horseList = db.horseInList {
                        if horseList.isEmpty {
                            Text("No horses found")
                                .foregroundColor(.gray)
                                .padding(.top, 8)
                        } else {
                            let sortedHorses = horseList.sorted { horse1, horse2 in
                                let totalPercentage1 = (horse1.strength + horse1.speed + horse1.endurance + horse1.maintenance) / 4
                                let totalPercentage2 = (horse2.strength + horse2.speed + horse2.endurance + horse2.maintenance) / 4
                                
                                if totalPercentage1 != totalPercentage2 {
                                    // Sort by total percentage in descending order
                                    return totalPercentage1 > totalPercentage2
                                } else {
                                    // Sort by name in ascending order
                                    return horse1.name < horse2.name
                                }
                            }
                            
                            ForEach(sortedHorses, id: \.id) { horse in
                                NavigationLink(destination: HorseView(selectedHorse: horse)) {
                                    HorseImage(horseName: horse.name, horseImage: "https://source.unsplash.com/featured/?horse", totalPercentage: horse.totalPercentage)
                                }
                            }
                        }
                    }else {
                        ProgressView() // Display a loading indicator
                            .padding(.top, 8)
                    }
                }
                .padding(6)
            }
            .frame(maxWidth: .infinity)
            .background(Color("lightPurple"))
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(appModel: .init(selectedTab: .home))
//    }
//}
