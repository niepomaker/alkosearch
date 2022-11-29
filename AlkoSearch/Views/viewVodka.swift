//
//  ContentView.swift
//  AlkoSearch
//
//  Created by Łukasz Paprot on 17/11/2022.
//

import SwiftUI

struct viewVodka: View {
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
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                    .padding(.vertical, 15)
                                    
                                Image(systemName: "wineglass.fill")
                                    .foregroundColor(Color.white)
                                    .padding(.vertical, 15)
                                    .font(.largeTitle)
                            }
                            
                        }.buttonStyle(.plain)
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
                                Image(item.image)
                                    .resizable()
                                    .frame(width: 100,height: 100)
                                Text(item.name.capitalized)
                                    .font(.title2)
                                    .foregroundColor(Color.black)
                                    .padding(/*@START_MENU_TOKEN@*/.vertical, 10.0/*@END_MENU_TOKEN@*/)
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
            
        
        
    init(){
        model.getDrinks("drinksVodka")
    }

}

struct viewVodka_Previews: PreviewProvider {
    static var previews: some View {
        viewVodka()
    }
}

