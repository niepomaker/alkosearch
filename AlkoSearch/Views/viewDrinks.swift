//
//  ContentView.swift
//  AlkoSearch
//
//  Created by Łukasz Paprot on 17/11/2022.
//

import SwiftUI

struct viewDrinks: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView{
            ZStack {
                Image("background").resizable().ignoresSafeArea()
                VStack{
                    Spacer()
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                        
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
                    VStack{
                        List{
                            NavigationLink{
                                viewAlcohol("drinksGin")
                            } label: {
                                    Image("gin")
                                        .resizable()
                                        .frame(width: 150,height: 150)
                                    Text("Drinki z ginem    ")
                                        .font(.title2)
                                        .foregroundColor(Color.black)
                                        
                            }
                            .shadow(radius: 10)
                            
                            NavigationLink{
                                viewAlcohol("drinksJager")
                            } label: {
                                Image("jager")
                                    .resizable()
                                    .frame(width: 150,height: 150)
                                Text("Drinki z Jagerme")
                                    .font(.title2)
                                    .foregroundColor(Color.black)
                                
                            }.shadow(radius: 10)
                            
                            NavigationLink{
                                viewAlcohol("drinksVodka")
                            } label: {
                                Image("wodka")
                                    .resizable()
                                    .frame(width: 150,height: 150)
                                Text("Drinki z wódką")
                                    .font(.title2)
                                    .foregroundColor(Color.black)
                                
                            }.shadow(radius: 10)
                            
                            NavigationLink{
                                viewAlcohol("drinksWhisky")
                            } label: {
                                Image("whisky")
                                    .resizable()
                                    .frame(width: 150,height: 150)
                                Text("Drinki z whisky")
                                    .font(.title2)
                                    .foregroundColor(Color.black)
                                
                            }.shadow(radius: 10)
                            
                            NavigationLink{
                                viewAlcohol("drinksRum")
                            } label: {
                                Image("rum")
                                    .resizable()
                                    .frame(width: 150,height: 150)
                                Text("Drinki z rumem")
                                    .font(.title2)
                                    .foregroundColor(Color.black)
                                
                            }.shadow(radius: 10)
                            
                            NavigationLink{
                                viewAlcohol("drinksTequila")
                            } label: {
                                Image("tequila")
                                    .resizable()
                                    .frame(width: 150,height: 150)
                                Text("Drinki z tequilą")
                                    .font(.title2)
                                    .foregroundColor(Color.black)
                                
                            }.shadow(radius: 10)
                        }.cornerRadius(20)
                    }
                    .navigationBarBackButtonHidden(true)
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                        
                    }){
                        Text("Powrót")
                            .frame(width: 200,height: 50)
                            .background(Color.red)
                            .foregroundColor(Color.white)
                            .cornerRadius(20)
                            .bold()
                            .font(.title2)
                    }.buttonStyle(.plain)
                }
                .frame(width: 350)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


struct viewDrinks_Previews: PreviewProvider {
    static var previews: some View {
        viewDrinks()
    }
}
