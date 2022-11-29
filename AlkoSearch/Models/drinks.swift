//
//  drinks.swift
//  AlkoSearch
//
//  Created by Łukasz Paprot on 17/11/2022.
//

import Foundation

struct Drinks: Identifiable, Hashable{
    var id: String
    var name: String
    var com0: String
    var com1: String
    var com2: String
    var com3: String
    var com4: String
    var com5: String
    var com6: String
    var com7: String
    var com8: String
    var com9: String
    var image: String
    var notes: String
    
    func ifContains(_ data: String) -> Bool{
        if(
            self.com0.contains(data) || self.com1.contains(data) || self.com2.contains(data) ||
            self.com3.contains(data) || self.com4.contains(data) || self.com5.contains(data) ||
            self.com6.contains(data) || self.com7.contains(data) || self.com8.contains(data) || self.com9.contains(data)
        ) {
            return true
        } else {
            return false
        }
    }
}
