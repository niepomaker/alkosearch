//
//  addDrinkId.swift
//  AlkoSearch
//
//  Created by Łukasz Paprot on 23/11/2022.
//

import Foundation

class AddDrinkId: ObservableObject{
    @Published public var usedDrinks: [String] = []
    
    func addIdToList(_ drinkId: String){
        print(usedDrinks)
        usedDrinks.append(drinkId)
    }
    
}
