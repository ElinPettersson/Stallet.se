//
//  UserView.swift
//  Stallet.se
//
//  Created by Elin Pettersson on 2023-02-03.
//

import SwiftUI

struct UserView: View {
    
    @EnvironmentObject var db: DatabaseConnection
    @ObservedObject var appModel: AppModel
    
//    @State private var selectedHorse: Horse?
//    @State private var isShowingHorseDetail = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                
                Button(action: {
                    db.logoutUser()
                }, label: {
                    Image(systemName: "door.french.open")
                        .foregroundColor(.black)
                })
                
                Text("\(db.currentUser?.name ?? "")s stable")
                    .font(.largeTitle.lowercaseSmallCaps())
                    .foregroundColor(Color("textWhite"))
                    .shadow(color: Color(.black), radius: 2, x: 0, y: 2)
                    .padding(.top, 24)
                
                
                ScrollView {
                    
                    if db.currentUser != nil {
                        if let horseList = db.horseInList {
                            
                            ForEach(horseList, id: \.name) { horse in

                                NavigationLink(destination: {
                                    HorseView(selectedHorse: horse)

                                }, label: {
                                    HorseListItem(horseName: horse.name, horseImage: horse.image ?? "https://source.unsplash.com/featured/?horse", gender: horse.gender, breed: horse.breed)
                                })
                            }
                        }
                    }
                }
                .foregroundColor(Color("white"))
                .frame(maxWidth: .infinity)
                .padding(16)
                Spacer()
            }
            .background(Color("lightPurple"))
        }
    }
}
