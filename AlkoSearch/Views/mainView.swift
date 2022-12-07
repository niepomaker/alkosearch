//
//  ContentView.swift
//  AlkoSearch
//
//  Created by Łukasz Paprot on 16/11/2022.
//

import SwiftUI

struct mainView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Image("background").resizable().ignoresSafeArea()
                VStack{
                    HStack{
                        Text("AlkoSearch")
                            .font(.custom("AmericanTypeWriter", size: 46))
                            .bold()
                            .foregroundColor(Color.black)
                            .padding(.top, 20)
                        Image(systemName: "wineglass.fill")
                            .foregroundColor(Color.black)
                            .font(.system(size: 46))
                            .padding(.top, 20)
                    }
                    
                        Spacer()
                    Group{
                        NavigationLink(destination: viewDrinks()){
                                Text("Lista drinków")
                                    .frame(width: 325, height: 100)
                                    .font(.custom("Cochin", size: 34))
                                    .bold()
                                    .background(Color(red: 0.724, green: 0.721, blue: 1.0))
                                    .cornerRadius(20)
                                    .shadow(radius: 30)
                                    .navigationBarTitle("")
                                    .navigationBarBackButtonHidden(true)
                                    .navigationBarHidden(true)
                            }.buttonStyle(.plain)
                        NavigationLink(destination: findDrink()){
                            Text("Znajdź drinka")
                                .bold()
                                .frame(width: 325, height: 100)
                                .font(.custom("Cochin", size: 34))
                                .background(Color(red: 0.893, green: 0.889, blue: 1.0))
                                .foregroundColor(.black)
                                .cornerRadius(20)
                                .shadow(radius: 30)
                        }
                        .navigationTitle("")
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                        .buttonStyle(.plain)
                        NavigationLink(destination: Searching()){
                        Text("Wyszukaj drinka")
                            .bold()
                            .font(.custom("Cochin", size: 34))
                            .frame(width: 325, height: 100)
                            .background(Color(hue: 0.992, saturation: 0.062, brightness: 0.963))
                            .foregroundColor(.black)
                            .cornerRadius(20)
                            .shadow(radius: 30)
                            
                            .foregroundColor(.white)
                        }
                        .navigationTitle("Back")
                        .buttonStyle(.plain)
                        NavigationLink(destination: AddDrink()){
                            Text("Dodaj drinka")
                                .frame(width: 325, height: 100)
                                .bold()
                                .font(.custom("Cochin", size: 34))
                                .background(Color(red: 0.935, green: 0.773, blue: 0.821))
                                .cornerRadius(20)
                                .shadow(radius: 30)
                                .navigationBarTitle("")
                                .navigationBarBackButtonHidden(true)
                                .navigationBarHidden(true)
                        }.buttonStyle(.plain)
                    }.padding(.vertical)
                    Spacer()
                    
                    HStack{
                        Text("Copyright")
                        Image(systemName: "c.circle")
                        Text("All copyrights reserved.")
                    }
                    .padding(.top, 10)
                     .font(.footnote)
                }
            }
            .accentColor(.white)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
}


struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        mainView()
    }
}
