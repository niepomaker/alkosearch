//
//  ContentView.swift
//  AlkoSearch
//
//  Created by Łukasz Paprot on 17/11/2022.
//

import SwiftUI

struct viewAlcohol: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var path = NavigationPath()
    
    @ObservedObject var model = ViewModel()
    
    var body: some View {
            NavigationView{
                ZStack {
                    Image("background").resizable().ignoresSafeArea()
                    VStack{
                        NavigationLink{
                            mainView()
                        } label:{
                            HStack{
                                Text("AlkoSearch")
                                    .font(.custom("AmericanTypeWriter", size: 46))
                                    .bold()
                                    .foregroundColor(Color.black)
                                    .padding(.top, 10)
                                    .padding(.bottom, 10)
                                Image(systemName: "wineglass.fill")
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 46))
                                    .padding(.bottom, 10)
                            }
                            
                        }.buttonStyle(.plain)
                        Spacer()
                        Spacer()
                        ScrollView {
                            ForEach(model.list) {item in
                                NavigationLink(destination: viewDrink(drink: item)){
                                    HStack{
                                        Image(item.image)
                                            .resizable()
                                            .frame(width: 100,height: 100)
                                        VStack(alignment: .leading){
                                            Text(item.name.capitalized)
                                                .font(.title2)
                                                .foregroundColor(Color.black)
                                                .padding(.trailing, 20.0)
                                            Text(" " + item.notes)
                                                .font(.callout)
                                                .foregroundColor(.black)
                                        }
                                        Spacer()
                                        Image(systemName: "arrow.right")
                                            .foregroundColor(.black)
                                            .padding(.trailing, 20)       
                                    }
                                    .frame(width: 375, height: 100, alignment: .leading)
                                    .background(.white)
                                    .cornerRadius(20)
                                    .shadow(radius: 5)
                                }.buttonStyle(.plain)
                            }
                        }

                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                            
                        }){
                            Text("Powrót")
                                .frame(width: 200,height: 50)
                                .background(Color(hue: 1.0, saturation: 0.62, brightness: 0.932))
                                .foregroundColor(Color.white)
                                .cornerRadius(20)
                                .font(.title2)
                                .bold()
                                .padding(.top, 10)
                        }.buttonStyle(.plain)
                        }.frame(width: 350)
                    .navigationBarBackButtonHidden(true)
                }
                }
            .navigationBarBackButtonHidden(true)
            .accentColor(.white)
        }
            
        
        
    init(_ alcohol: String){
        model.getDrinks(alcohol)
    }

}

struct viewAlcohol_Previews: PreviewProvider {
    static var previews: some View {
        viewAlcohol("drinksVodka")
    }
}

