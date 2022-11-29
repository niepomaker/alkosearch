//
//  checkUsedIdDrink.swift
//  AlkoSearch
//
//  Created by Łukasz Paprot on 23/11/2022.
//

//import Foundation
//import SwiftUI
//
//class checkUsedIdDrinks: ObservableObject{
//    @Published var listDrinks: [String] = []
//    @ObservedObject var usedDrinksIds = AddDrinkId()
//    @ObservedObject var modelGin = ViewModel()
//    var listOfComponenets: Binding<[String]>?
//
//
//    func checkAllDrinks() -> [String]{
//        List(modelGin.list){ drink in
//            List(listOfComponenets!.projectedValue, id: \.self){com in
//                if(drink.com0.contains(com.wrappedValue) || drink.com1.contains(com.wrappedValue) || drink.com2.contains(com.wrappedValue) ||
//                   drink.com3.contains(com.wrappedValue) || drink.com4.contains(com.wrappedValue) || drink.com5.contains(com.wrappedValue) ||
//                   drink.com6.contains(com.wrappedValue) || drink.com7.contains(com.wrappedValue) || drink.com8.contains(com.wrappedValue) ||
//                   drink.com9.contains(com.wrappedValue)){
//                    addIdToList(drink.id)
//                }
//            }
//
//        }
//        return listDrinks
//    }
//
//    func addIdToList(_ drinkId: String){
//        listDrinks.append(drinkId)
//    }
//
//    init(modelGin: ViewModel = ViewModel()) {
//        self.modelGin = modelGin
//    }
//
//}
