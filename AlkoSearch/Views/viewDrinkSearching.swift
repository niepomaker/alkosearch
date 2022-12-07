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
    var drink: Drinks
    var listFromNotes: [String]{
        return drink.notes.components(separatedBy: " - ")
    }
    var listOfIngredients: [String] {
        return [drink.com0, drink.com1, drink.com2, drink.com3, drink.com4, drink.com5, drink.com6, drink.com7, drink.com8, drink.com9]
    }
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .top){
                Image("background").resizable().ignoresSafeArea()
                VStack{
                    Text(drink.name.capitalized)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color.white)
                    Image(drink.image)
                        .resizable()
                        .frame(width: 300,height: 300)
                    Spacer()
                        
                    HStack {
                        ForEach(listFromNotes, id: \.self){item in
                            Text(item)
                                .frame(width: 95, height: 50, alignment: .center)
                                .background(Color(red: 0.936, green: 0.777, blue: 0.82))
                                .cornerRadius(10)
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                    .shadow(radius: 5)
                    Spacer()
                        Rectangle().fill(Color(red: 0.444, green: 0.433, blue: 0.999)).frame(width: 350, height: 1)
                        ScrollView {
                            ForEach(listOfIngredients, id: \.self){ingredient in
                                if(ingredient != ""){
                                    if(CheckDrink().checkIfComExist(drinkCom: ingredient, listofComs: listOfComponenets!)){
                                        HStack{
                                            Image(systemName: "checkmark.circle.fill")
                                                .padding(.leading, 10)
                                                .foregroundColor(.green)
                                                .font(.custom("Cochin", size: 15))
                                            Text(ingredient)
                                                .font(.title2)
                                                .foregroundColor(.black)
                                                .background(.white)
                                                .cornerRadius(20)
                                        }.frame(width: 350, height: 50, alignment: .leading)
                                            .background(.white)
                                            .cornerRadius(20)
                                    } else {
                                        HStack{
                                            Image(systemName: "xmark.circle.fill")
                                                .padding(.leading, 10)
                                                .foregroundColor(.red)
                                                .font(.custom("Cochin", size: 15))
                                            Text(ingredient)
                                                .font(.title2)
                                                .foregroundColor(.black)
                                                .background(.white)
                                                .cornerRadius(20)
                                        }.frame(width: 350, height: 50, alignment: .leading)
                                            .background(.white)
                                            .cornerRadius(20)
                                    }
                                }
                            }
                        }
                }
            }
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
        .accentColor(.white)
    }
    
    
    func showIngredients(_ ingredient: String) -> AnyView {
        return AnyView(
                HStack{
                    Image(systemName: "circle.fill")
                        .padding(.leading, 10)
                        .foregroundColor(Color(red: 0.456, green: 0.445, blue: 0.999))
                        .font(.custom("Cochin", size: 15))
                    Text(ingredient)
                        .font(.title2)
                        .foregroundColor(.black)
                        .background(.white)
                        .cornerRadius(20)
                }.frame(width: 350, height: 50, alignment: .leading)
                    .background(.white)
                    .cornerRadius(20)
        )
    }
}
