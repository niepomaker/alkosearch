//
//  ContentView.swift
//  AlkoSearch
//
//  Created by Łukasz Paprot on 16/11/2022.
//

import SwiftUI

struct AddDrink: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var whichAlcohol:String = ""
    @State var isExpanded = false
    
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    
    @State private var image: UIImage?
    
//    @State var howManyComs:Int
    @State var com0 = ""
    @State var com1 = ""
    @State var com2 = ""
    @State var com3 = ""
    @State var com4 = ""
    @State var com5 = ""
    @State var com6 = ""
    @State var com7 = ""
    @State var com8 = ""
    @State var com9 = ""
    @State var name = ""
    let possibleAlcohol = ["Gin", "Jager", "Wódka", "Rum", "Whisky", "Tequila"]
    var listComs: [String] {
        return [com0, com1, com2, com3, com4, com5, com6, com7, com8, com9]
    }
    var body: some View {
        NavigationView {
            ZStack{
                Image("background").resizable().ignoresSafeArea()
                VStack{
                    Button(action: {
                        mainView()
                        
                    }){
                        HStack{
                            Text("AlkoSearch")
                                .font(.custom("AmericanTypeWriter", size: 46))
                                .bold()
                                .foregroundColor(Color.black)
                                .padding(.top, 10)
                            Image(systemName: "wineglass.fill")
                                .foregroundColor(Color.black)
                                .font(.system(size: 46))
                                .padding(.top, 10)
                        }
                    }.buttonStyle(.plain)
                    Spacer()
                    Form {
                        Section(header: Text("Rodzaj alkoholu")) {
                            HStack{
                                Menu{
                                    ForEach(possibleAlcohol, id: \.self){item in
                                        Button(action: {
                                            whichAlcohol = item
                                        }, label: {
                                            Text(item)
                                        })
                                    }
                                } label: {
                                    Label(
                                        title: {Text("Wybierz rodzaj alkoholu: \(whichAlcohol)").foregroundColor(.black)},
                                        icon: {Image(systemName: "plus").foregroundColor(.black).padding(.leading, 30)})
                                }
                                
                            }
                            .frame(width: 350, height: 1, alignment: .leading)
                            .padding(.all)
                            .background(.white)
                            .cornerRadius(30)
                            TextField("Podaj nazwę drinka ", text: $name)
                        }
                    }.frame(width: 375, height: 150)
                    .cornerRadius(30)
                    
                    Form{
                        Section(header: Text("Składniki")){
                                VStack {
                                    TextField("Pierwszy składnik", text: $com0)
                                    TextField("Drugi składnik", text: $com1)
                                    TextField("Trzeci składnik", text: $com2)
                                    TextField("Czwarty składnik", text: $com3)
                                    TextField("Piąty składnik", text: $com4)
                                    TextField("Szósty składnik", text: $com5)
                                    TextField("Siódmy składnik", text: $com6)
                                    TextField("Ósmy składnik", text: $com7)
                                    TextField("Dziewiąty składnik", text: $com8)
                                    TextField("Dziesiąty składnik", text: $com9)
                                    
                                }
                            }
                        
                    }.frame(width: 375, height: 375)
                    .cornerRadius(30)
                    
                    Spacer()
                    Spacer()
                    HStack {
                        if(image != nil){
                            Image(uiImage: image!)
                                .resizable()
                                .frame(width: 90, height: 80)
                                .cornerRadius(20)
                                .shadow(radius: 10)
                                .padding(.leading, 25)
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                                .frame(width: 90, height: 75)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .shadow(radius: 10)
                                .padding(.leading, 25)
                        }
                        Button("+  Dodaj zdjęcie") {
                            self.showSheet = true
                        }.frame(width: 200, height: 50, alignment: .center)
                            .background(.white)
                            .cornerRadius(20)
                            .foregroundColor(.black)
                            .buttonStyle(.plain)
                            .padding()
                            .shadow(radius: 10)
                            .actionSheet(isPresented: $showSheet) {
                                ActionSheet(title: Text("Select Photo"), message: Text("Choose"), buttons: [
                                    .default(Text("Photo Library")) {
                                        self.showImagePicker = true
                                        self.sourceType = .photoLibrary
                                    },
                                    .default(Text("Camera")) {
                                        self.showImagePicker = true
                                        self.sourceType = .camera
                                    },
                                    .cancel()
                                ])
                        }
                    }
                            
                    Spacer()
                    
                    HStack{
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()

                        }){
                            Text("Powrót")
                                .frame(width: 175,height: 50)
                                .background(Color(hue: 1.0, saturation: 0.62, brightness: 0.932))
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .font(.title)
                                .bold()
                                .padding(.top, 10)
                        }.buttonStyle(.plain)
                        Spacer()
                        NavigationLink(destination: mainView()){
                            Text("Dodaj")
                                .frame(width: 175,height: 50)
                                .background(Color(red: 0.412, green: 0.399, blue: 1.0))
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .padding(.top, 10)
                                .bold()
                                .font(.title)
                        }.buttonStyle(.plain)
                            .accentColor(.white)
                            .navigationBarBackButtonHidden(true)
                    }.frame(width: 350)
                }
            }.accentColor(.white)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }.navigationBarHidden(true)
         .navigationBarBackButtonHidden(true)
         .sheet(isPresented: $showImagePicker) {
             ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType: self.sourceType)
             
         }
    }
    
}

struct AddDrink_Previews: PreviewProvider {
    static var previews: some View {
        AddDrink()
    }
}

