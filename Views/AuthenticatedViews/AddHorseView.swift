//
//  AddHorseView.swift
//  Stallet.se
//
//  Created by Elin Pettersson on 2023-05-19.
//

import SwiftUI

struct AddHorseView: View {
    
    @EnvironmentObject var db: DatabaseConnection
    
    @State private var name: String = ""
    @State private var born: Int = 2006
    @State private var gender: String = "Mare/Filly"
    @State private var breed: String = "Thoroughbred"
    @State private var caliber: String = "Warmblood"
    @State private var horseType: String = "Horse"
    @State private var horseColor: String = "Bay"
    @State private var description: String = ""
    @State private var image: String = ""
//    @State var owner: String
    
    @State private var selectedYear = Calendar.current.component(.year, from: Date())
        private let startYear = Calendar.current.component(.year, from: Date()) - 50
        private let yearsRange = 51
    
    @State private var selectedStringOption = "Option 1"
    
    
    let horseGenders = ["Mare/Filly", "Gelding", "Stallion/Colt"]
    let horseBreeds = [
        "Thoroughbred",
        "Quarter Horse",
        "Arabian",
        "Paint Horse",
        "Appaloosa",
        "Warmblood",
        "Morgan",
        "Tennessee Walking Horse",
        "American Saddlebred",
        "Standardbred",
        "Friesian",
        "Hanoverian",
        "Andalusian",
        "Pony of the Americas",
        "Paso Fino",
        "Shetland Pony",
        "Welsh Pony",
        "Clydesdale",
        "Belgian",
        "Percheron"
    ]
    
    let horseCalibers = ["Warmblood", "Coldblood", "Hotblood", "Mixed/Crossbred"]
    
    let horseTypes = ["Horse", "Pony"]
    
    let horseColors = [
        "Bay",
        "Black",
        "Brown",
        "Chestnut",
        "Gray",
        "Roan",
        "Palomino",
        "Buckskin",
        "Dun",
        "Perlino",
        "Cremello",
        "Grullo",
        "Appaloosa",
        "Pinto",
        "Skewbald",
        "Piebald",
        "Tobiano",
        "Overo",
        "Sabino",
        "Splash",
        "Rabicano",
        "Sooty",
        "Silver",
        "Champagne",
        "Cream",
        "White"
    ]
    
    var body: some View {
        ScrollView {
            Spacer()
            Text("Add a new horse to your stable")
                .font(.largeTitle)
                .foregroundColor(Color("textWhite"))
                .shadow(color: Color("black"), radius: 2, x: 0, y: 2)
                .padding(.bottom, 16)
            
            VStack(alignment: .leading) {
                
                Text("Name")
                    .foregroundColor(.white)
                TextField("", text: $name)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding(.bottom, 8)
                
                VStack(alignment: .leading) {
                            Text("Born")
                                .foregroundColor(.white)
                            Picker("Year", selection: $born) {
                                ForEach(startYear..<(startYear + yearsRange)) { year in
                                    Text(String(year))
                                        .tag(year)
                                        .contentShape(Rectangle())
                                        .onTapGesture {
                                            selectedYear = year
                                        }
                                        .frame(width: 50)
                                        .foregroundColor(Color.primary)
                                        .font(.system(size: 16))
                                        .multilineTextAlignment(.center)
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.5)
                                        .padding(8)
                                        .background(selectedYear == year ? Color.blue.opacity(0.2) : Color.clear)
                                        .cornerRadius(8)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color.blue, lineWidth: selectedYear == year ? 2 : 0)
                                        )
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .background(content: {
                                Color(white: 1.0, opacity: 1.0)
                            })
                            
                            Text("Gender")
                                .foregroundColor(Color("textWhite"))
                    StringPickerView(selectedOption: $gender, options: horseGenders)
                            
                            Text("Breed")
                                .foregroundColor(Color("textWhite"))
                            StringPickerView(selectedOption: $breed, options: horseBreeds)
                        }
                
                    VStack(alignment: .leading) {
                        Text("Caliber")
                            .foregroundColor(Color("textWhite"))
                        StringPickerView(selectedOption: $caliber, options: horseCalibers)
                        
                        Text("Type")
                            .foregroundColor(Color("textWhite"))
                        StringPickerView(selectedOption: $horseType, options: horseTypes)
                        
                        Text("Color")
                            .foregroundColor(Color("textWhite"))
                        StringPickerView(selectedOption: $horseColor, options: horseColors)
                    }
                Text("Description")
                    .foregroundColor(.white)
                TextField("Enter your horse description here", text: $description)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 32)
            .onChange(of: selectedYear) { newYear in
                        let currentYear = Calendar.current.component(.year, from: Date())
                        if newYear > currentYear {
                            selectedYear = currentYear
                        }
                    }
            
            Button(action: {
                db.addHorse(name: name, born: born, gender: gender, breed: breed, caliber: caliber, type: horseType, color: horseColor, description: description)
            }, label: {
                Text("Add")
                    .frame(width: 160)
                    .foregroundColor(Color("textWhite"))
            })
            .tint(Color("darkPurple"))
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding(.bottom, 16)
        }
        .background(Color("lightPurple"))
        .textFieldStyle(.roundedBorder)
        .shadow(color: Color("black"), radius: 2, x: 0, y: 2)
    }
}

struct AddHorseView_Previews: PreviewProvider {
    static var previews: some View {
        AddHorseView()
    }
}

struct StringPickerView: View {
    @Binding var selectedOption: String
    var options: [String]
        
        var body: some View {
            VStack {
                
                Picker("Option", selection: $selectedOption) {
                    ForEach(options, id: \.self) { option in
                        Text(option)
                            .tag(option)
                            .contentShape(Rectangle())
                            .frame(width: 50)
                            .foregroundColor(Color.primary)
                            .font(.system(size: 16))
                            .multilineTextAlignment(.center)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                            .padding(8)
                            .cornerRadius(8)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .background(content: {
                    Color(white: 1.0, opacity: 1.0)
                })
            }
        }
}
