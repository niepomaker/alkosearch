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
        NavigationView {
            ZStack {
                Image("background").resizable().ignoresSafeArea()
                VStack {
                    Spacer()
                    Spacer()
                    Text("Lista drinków").foregroundColor(.white).font(.largeTitle).bold()
                    
                    ZStack{
                        ScrollView {
                            ForEach(models){model in
                                ForEach(model.list){item in
                                    if(CheckDrink().checkDinksCom(item, listOfComs: listOfComponenets!)){
                                        showDrink(item)
                                    }
                                }.buttonStyle(.plain)
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
                        .background(Color(hue: 1.0, saturation: 0.62, brightness: 0.932))
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                        .font(.title)
                        .bold()
                        .padding(.top, 10)
                }.buttonStyle(.plain)
            }
                    .frame(width: 350, alignment: .top)
            }.accentColor(.white)
                .navigationBarBackButtonHidden(true)
        }
        .navigationBarBackButtonHidden(true)
        .accentColor(.white)
        
        
    }
    
    func showDrink(_ drink: Drinks) -> AnyView {
        status.changeStatus()
        return AnyView(NavigationLink(destination: ViewDrinkSearching(listOfComponenets: listOfComponenets, drink: drink)) {
            HStack{
                Image(drink.image)
                    .resizable()
                    .frame(width: 100,height: 100)
                VStack(alignment: .leading){
                    Text(drink.name.capitalized)
                        .font(.title2)
                        .foregroundColor(Color.black)
                        .padding(.trailing, 20.0)
                    Text(" " + drink.notes)
                        .font(.callout)
                        .foregroundColor(.black)
                }
                Spacer()
                Image(systemName: "arrow.right")
                    .foregroundColor(.black)
                    .padding(.trailing, 20)
                
                
                
            }
            .buttonStyle(.plain)
            .frame(width: 375, height: 100, alignment: .leading)
            .background(.white)
            .cornerRadius(20)
            .shadow(radius: 5)
            
        })
        
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
