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
                        .navigationBarHidden(true)
                    VStack{
                        ScrollView{
                            NavigationLink{
                                viewAlcohol("drinksGin")
                            } label: {
                                    Image("gin")
                                        .resizable()
                                        .frame(width: 150,height: 150)
                                Rectangle().fill(.black).frame(width: 1)
                                    Text("Drinki z ginem    ")
                                        .font(.custom("Cochin", size: 30))
                                        .foregroundColor(.black)
                                        
                            }
                            .buttonStyle(.plain)
                            .frame(width: 375, height: 150, alignment: .leading)
                            .background(.white)
                            .cornerRadius(20)
                            .shadow(radius: 5)
                            NavigationLink{
                                viewAlcohol("drinksJager")
                            } label: {
                                Image("jager")
                                    .resizable()
                                    .frame(width: 150,height: 150)
                                Rectangle().fill(.black).frame(width: 1)
                                Text("Drinki z Jagerem")
                                    .font(.custom("Cochin", size: 28))
                                    .foregroundColor(Color.black)
                                
                            }
                            .buttonStyle(.plain)
                            .frame(width: 375, height: 150, alignment: .leading)
                            .background(.white)
                            .cornerRadius(20)
                            .shadow(radius: 5)
                            
                            NavigationLink{
                                viewAlcohol("drinksVodka")
                            } label: {
                                Image("wodka")
                                    .resizable()
                                    .frame(width: 150,height: 150)
                                Rectangle().fill(.black).frame(width: 1)
                                Text("Drinki z wódką")
                                    .font(.custom("Cochin", size: 30))
                                    .foregroundColor(Color.black)
                                
                            }
                            .buttonStyle(.plain)
                            .frame(width: 375, height: 150, alignment: .leading)
                            .background(.white)
                            .cornerRadius(20)
                            .shadow(radius: 5)
                            
                            NavigationLink{
                                viewAlcohol("drinksWhisky")
                            } label: {
                                Image("whisky")
                                    .resizable()
                                    .frame(width: 150,height: 150)
                                Rectangle().fill(.black).frame(width: 1)
                                Text("Drinki z whisky")
                                    .font(.custom("Cochin", size: 30))
                                    .foregroundColor(Color.black)
                                
                            }
                            .buttonStyle(.plain)
                            .frame(width: 375, height: 150, alignment: .leading)
                            .background(.white)
                            .cornerRadius(20)
                            .shadow(radius: 5)
                            
                            NavigationLink{
                                viewAlcohol("drinksRum")
                            } label: {
                                Image("rum")
                                    .resizable()
                                    .frame(width: 150,height: 150)
                                Rectangle().fill(.black).frame(width: 1)
                                Text("Drinki z rumem")
                                    .font(.custom("Cochin", size: 30))
                                    .foregroundColor(Color.black)
                                
                            }
                            .buttonStyle(.plain)
                            .frame(width: 375, height: 150, alignment: .leading)
                            .background(.white)
                            .cornerRadius(20)
                            .shadow(radius: 5)
                            
                            NavigationLink{
                                viewAlcohol("drinksTequila")
                            } label: {
                                Image("tequila")
                                    .resizable()
                                    .frame(width: 150,height: 150)
                                Rectangle().fill(.black).frame(width: 1)
                                Text("Drinki z tequilą")
                                    .font(.custom("Cochin", size: 30))
                                    .foregroundColor(Color.black)
                                
                            }
                            .buttonStyle(.plain)
                            .frame(width: 375, height: 150, alignment: .leading)
                            .background(.white)
                            .cornerRadius(20)
                            .shadow(radius: 5)
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
                            .background(Color(hue: 1.0, saturation: 0.62, brightness: 0.932))
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
