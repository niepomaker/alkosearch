//
//  ContentView.swift
//  AlkoSearch
//
//  Created by Łukasz Paprot on 16/11/2022.
//

import SwiftUI

struct Searching: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var modelGin = ViewModel()
    @ObservedObject var modelJager = ViewModel()
    @ObservedObject var modelVodka = ViewModel()
    @ObservedObject var modelWhisky = ViewModel()
    @ObservedObject var modelRum = ViewModel()
    @ObservedObject var modelTequila = ViewModel()
    @State var drink = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("background").resizable().ignoresSafeArea()
                VStack{
                    Spacer()
                    Spacer()
                    NavigationView{
                        VStack {
                            List{
                                showDrink(modelGin.list)
                                showDrink(modelJager.list)
                                showDrink(modelVodka.list)
                                showDrink(modelWhisky.list)
                                showDrink(modelRum.list)
                                showDrink(modelTequila.list)
                            }
                        }
                    }.cornerRadius(30)
                        .padding(.top, 30)
                    Spacer()
                    Spacer()
                    Spacer()
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        Text("Powrót")
                            .frame(width: 200,height: 50)
                            .background(.red)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .bold()
                            .font(.title2)
                        }.buttonStyle(.plain)
                    
                }.searchable(text: $drink)
                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    .font(.title2)
                    .frame(width: 375, height: 750)
            }
        }.navigationBarBackButtonHidden(true)
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .scrollDismissesKeyboard(.immediately)
        
    }
    
    func drinks(_ data: [Drinks]) -> [Drinks] {
        let lcDrinks = data
        return drink == "" ? lcDrinks : lcDrinks.filter({
            $0.name.contains(drink.lowercased())
        })
    }
        
    func showDrink(_ model: [Drinks]) -> some View{
        let allDrink = drinks(model)
        return ForEach(allDrink, id: \.self){ item in
            NavigationLink(destination: viewDrink(drinkID: item.id, drinkName: item.name, drinkImage: item.image,                                        drinkCom0: item.com0, drinkCom1: item.com1, drinkCom2: item.com2,                                      drinkCom3: item.com3, drinkCom4: item.com4, drinkCom5: item.com5,                                      drinkCom6: item.com6, drinkCom7: item.com7, drinkCom8: item.com8,                                      drinkCom9: item.com9)){
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
            }.accentColor(.white)
        }

        
    }
    
    init(){
        modelGin.getDrinks("drinksGin")
        modelJager.getDrinks("drinksJager")
        modelVodka.getDrinks("drinksVodka")
        modelWhisky.getDrinks("drinksWhisky")
        modelRum.getDrinks("drinksRum")
        modelTequila.getDrinks("drinksTequila")
    }
}
            


struct Searching_Previews: PreviewProvider {
    static var previews: some View {
        Searching()
    }
}
