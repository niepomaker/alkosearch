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
    @State var ifSearching = false
    var models: [ViewModel] = []
    var modelList:[[Drinks]] {
        return [modelGin.list, modelJager.list, modelVodka.list, modelRum.list, modelWhisky.list, modelTequila.list]
    }
    @State var drink = ""
    
    var body: some View {
        ZStack{
                Image("background").resizable().ignoresSafeArea()
                VStack{
                    Spacer()
                    NavigationView{
                        ScrollView{
                            ForEach(modelList, id: \.self){item in
                                showDrink(item)
                            }
                            
                        }
                    }.searchable(text: $drink, placement: .navigationBarDrawer(displayMode: .always),  prompt: "Wyrzukaj drinka")
                     .accentColor(.black)
                     .buttonStyle(.plain)
                     .cornerRadius(30)
                
                     
                    if !ifSearching{
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
                    
                    
                }
                .cornerRadius(40)
            
            }.navigationBarHidden(true)

        
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
            NavigationLink(destination: ViewSearching(drink: item)){
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
                .frame(width: 375, height: 100, alignment: .top)
                .background(.white)
                .cornerRadius(20)
                .shadow(radius: 5)
            }.accentColor(.white)
                .buttonStyle(.plain)
        }
    }
    
    init(){
        modelGin.getDrinks("drinksGin")
        modelJager.getDrinks("drinksJager")
        modelVodka.getDrinks("drinksVodka")
        modelWhisky.getDrinks("drinksWhisky")
        modelRum.getDrinks("drinksRum")
        modelTequila.getDrinks("drinksTequila")
        self.models = [modelGin, modelJager, modelVodka, modelWhisky, modelRum, modelTequila]
    }
}
            


struct Searching_Previews: PreviewProvider {
    static var previews: some View {
        Searching()
    }
}
