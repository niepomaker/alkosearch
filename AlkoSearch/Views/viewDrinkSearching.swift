//
//  ContentView.swift
//  AlkoSearch
//
//  Created by Łukasz Paprot on 17/11/2022.
//

import SwiftUI

struct ViewDrinkSearching: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var listOfComponenets: Binding<[String]>?
    
    var drinkID: String = ""
    var drinkName: String = ""
    var drinkImage: String = ""
    var drinkCom0: String = ""
    var drinkCom1: String = ""
    var drinkCom2: String = ""
    var drinkCom3: String = ""
    var drinkCom4: String = ""
    var drinkCom5: String = ""
    var drinkCom6: String = ""
    var drinkCom7: String = ""
    var drinkCom8: String = ""
    var drinkCom9: String = ""
    var drinkNotes: String = ""
    
    var listOfIngredients: [String] {
        return [drinkCom0, drinkCom1, drinkCom2, drinkCom3, drinkCom4, drinkCom5, drinkCom6, drinkCom7, drinkCom8, drinkCom9]
    }
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .top){
                Image("background").resizable().ignoresSafeArea()
                VStack{
                    Text(drinkName.capitalized)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color.white)
                    Image(drinkImage)
                        .resizable()
                        .frame(width: 300,height: 300)
                    Spacer()
                    List {
                        
                        Section(header: Text("Dodatkowe informacje")){
                            Text(drinkNotes)
                                .font(.title2)
                        }
                        Section(header: Text("Składniki")){
                            ForEach(listOfIngredients, id: \.self){ingredient in
                                if(ingredient != ""){
                                    if(CheckDrink().checkIfComExist(drinkCom: ingredient, listofComs: listOfComponenets!)){
                                        HStack{
                                            Image(systemName: "checkmark.circle.fill")
                                                .foregroundColor(.green)
                                            Text(ingredient)
                                                .font(.title2)
                                                .foregroundColor(.black)
                                        }
                                    } else {
                                        HStack{
                                            Image(systemName: "xmark.circle.fill")
                                                .foregroundColor(.red)
                                            Text(ingredient)
                                                .font(.title2)
                                                .foregroundColor(.black)
                                        }
                                    }
                                }
                            }
                        }
                        
                    }.frame(width: 375, height: 330)
                        .cornerRadius(20)
                }
                .navigationBarTitle("")
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            }
        }
    }
}
