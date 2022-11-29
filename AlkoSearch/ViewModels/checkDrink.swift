//
//  checkIdDrink.swift
//  AlkoSearch
//
//  Created by Łukasz Paprot on 23/11/2022.
//

import Foundation
import SwiftUI

class CheckDrink {
    var counter: Int = 0
    var newCounter: Int = 0

    
    func checkDinksCom(_ drink: Drinks, listOfComs: Binding<[String]>) -> Bool{
        for com in listOfComs.projectedValue {
            if(drink.ifContains(com.wrappedValue)){
                counter += 1
            }
        }
        if(checkHowManyComs(drink) - counter <= 5 && counter > 1){
            return true
        }
        return false
    }
    
    func checkHowManyComs(_ drink: Drinks) -> Int{
        let mirrored_object = Mirror(reflecting: drink)
        for (_, attr) in mirrored_object.children.enumerated() {
            if(attr.value as! String != ""){
                    newCounter += 1
                }
        }
        return newCounter
        
    }
    
    func checkIfComExist(drinkCom: String, listofComs: Binding<[String]>) -> Bool{
        //wódka, rum
        for com in listofComs.projectedValue {
            if(com.wrappedValue.elementsEqual("wódka") && drinkCom.contains("wódka żurawinowa")) {
                continue
            }
            if(drinkCom.contains(com.wrappedValue)){
                return true
            }
        }
       return false
    }
    
}


