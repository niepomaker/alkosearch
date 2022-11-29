//
//  ContentView.swift
//  AlkoSearch
//
//  Created by Łukasz Paprot on 17/11/2022.
//

import SwiftUI

class CheckAnyDrink {
    var ifAnyDrinkOccurs: Bool = false
    
    func changeStatus() {
        ifAnyDrinkOccurs = true
    }
}

struct listDrinks: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var status = CheckAnyDrink()
    var listOfComponenets: Binding<[String]>?
    @ObservedObject var modelGin = ViewModel()
    @ObservedObject var modelJager = ViewModel()
    @ObservedObject var modelVodka = ViewModel()
    @ObservedObject var modelWhisky = ViewModel()
    @ObservedObject var modelRum = ViewModel()
    @ObservedObject var modelTequila = ViewModel()
    
    var models: [ViewModel] = []
    
    var body: some View {
        ZStack {
            Image("background").resizable().ignoresSafeArea()
            VStack {
                Spacer()
                Spacer()
                Text("Lista drinków").foregroundColor(.white).font(.largeTitle).bold()
                
                ZStack{
                    List {
                        ForEach(models){model in
                            ForEach(model.list){item in
                                if(CheckDrink().checkDinksCom(item, listOfComs: listOfComponenets!)){
                                    showDrink(item)
                                }
                            }
                        }
                    }.frame(width: 375)
                    .cornerRadius(20)
                    
                    if(status.ifAnyDrinkOccurs == false){
                        VStack{
                            Text("Żaden drink nie spełnia wymagań. Prośba o zmiane składników.")
                                .multilineTextAlignment(.center)
                                .frame(width: 375, height: 200)
                                .accentColor(.white)
                                .background(.white)
                                .foregroundColor(.red)
                                .cornerRadius(20)
                                .font(.largeTitle)
                                .bold()
                                .accessibilityLabel(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/)
                                .shadow(radius: 30)
                        }
                    }
                }
                
            Spacer()
            Button(action: {self.presentationMode.wrappedValue.dismiss()}){
                Text("Powrót")
                    .frame(width: 250,height: 50)
                    .background(Color.red)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                    .font(.title)
                    .bold()
                    .padding(.top, 10)
            }.buttonStyle(.plain)
        }.accentColor(.white)
                .frame(width: 350, alignment: .top)
        }
        .navigationBarBackButtonHidden(true)
        
        
    }
    
    func showDrink(_ drink: Drinks) -> AnyView {
        status.changeStatus()
        return AnyView(NavigationLink(destination: ViewDrinkSearching(listOfComponenets: listOfComponenets, drinkID: drink.id, drinkName: drink.name, drinkImage: drink.image, drinkCom0: drink.com0,
                                                               drinkCom1: drink.com1, drinkCom2: drink.com2, drinkCom3: drink.com3, drinkCom4: drink.com4,
                                                               drinkCom5: drink.com5, drinkCom6: drink.com6, drinkCom7: drink.com7, drinkCom8: drink.com8,
                                                               drinkCom9: drink.com9, drinkNotes: drink.notes)) {
            HStack {
                Image(drink.image)
                    .resizable()
                    .frame(width: 100,height: 100)
                Text(drink.name.capitalized)
                    .font(.title2)
                    .foregroundColor(Color.black)
                    .padding(/*@START_MENU_TOKEN@*/.vertical, 10.0/*@END_MENU_TOKEN@*/)
            }
        }.accentColor(.white))
        
    }
    
    init(listOfComponenets: Binding<[String]>){
        modelGin.getDrinks("drinksGin")
        modelJager.getDrinks("drinksJager")
        modelVodka.getDrinks("drinksVodka")
        modelWhisky.getDrinks("drinksWhisky")
        modelRum.getDrinks("drinksRum")
        modelTequila.getDrinks("drinksTequila")
        self.models = [modelGin, modelJager, modelVodka, modelWhisky, modelRum, modelTequila]
        self.listOfComponenets = listOfComponenets.projectedValue
    }
    
}
