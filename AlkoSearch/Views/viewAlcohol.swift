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
                        List(model.list) {item in
                            NavigationLink(destination: viewDrink(drinkID: item.id,
                                                                  drinkName: item.name,
                                                                  drinkImage: item.image,
                                                                  drinkCom0: item.com0,
                                                                  drinkCom1: item.com1,
                                                                  drinkCom2: item.com2,
                                                                  drinkCom3: item.com3,
                                                                  drinkCom4: item.com4,
                                                                  drinkCom5: item.com5,
                                                                  drinkCom6: item.com6,
                                                                  drinkCom7: item.com7,
                                                                  drinkCom8: item.com8,
                                                                  drinkCom9: item.com9)){
                                HStack{
                                    Image(item.image)
                                        .resizable()
                                        .frame(width: 100,height: 100)
                                    VStack(alignment: .leading){
                                        Text(item.name.capitalized)
                                            .font(.title3)
                                            .foregroundColor(Color.black)
                                            .padding(.trailing, 20.0)
                                        Text(" " + item.notes)
                                            .font(.footnote)

                                    }
                                }
                                
                            }
                                
                        }.cornerRadius(20)
                            
                            .navigationBarBackButtonHidden(true)
              
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                            
                        }){
                            Text("Powrót")
                                .frame(width: 200,height: 50)
                                .background(Color.red)
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
            .accentColor(.white)
            .navigationBarBackButtonHidden(true)
        }
            
        
        
    init(_ alcohol: String){
        model.getDrinks(alcohol)
    }

}

struct viewAlcohol_Previews: PreviewProvider {
    static var previews: some View {
        viewAlcohol("drinksGin")
    }
}

