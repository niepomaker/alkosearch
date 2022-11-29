//
//  ViewModel.swift
//  AlkoSearch
//
//  Created by Łukasz Paprot on 17/11/2022.
//

import Foundation
import Firebase

class dodanieDoDB: ObservableObject {
    var id = UUID().uuidString
    func addDrink(){
        let db = Firestore.firestore()
        db.collection("drinksVodka").document(id).setData([
            "name": "jager w tropikach",
            "image": "jagerWTropikach",
            "com0": "wódka 20ml",
            "com1": "jagermeister 40ml",
            "com2": "sok ananasowy 70ml",
            "com3": "ćwiartka cytryny",
            "com4": "pół kiwi",
            "com5": "kilka listków świeżej bazylii",
            "com6": nil,
            "com7": nil,
            "com8": nil,
            "com9": nil
        ]){ err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
}
