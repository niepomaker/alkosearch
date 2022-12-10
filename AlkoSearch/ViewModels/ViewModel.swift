//
//  ViewModel.swift
//  AlkoSearch
//
//  Created by Łukasz Paprot on 17/11/2022.
//

import Foundation
import Firebase

class ViewModel: ObservableObject, Identifiable {
    @Published var list = [Drinks]()
    
    
    func getDrinks(_ data: String){
        let db = Firestore.firestore()
        db.collection(data).getDocuments { snapshot, error in
            if error == nil {
                DispatchQueue.main.async {
                    if let snapshot = snapshot {
                        self.list = snapshot.documents.map { d in
                            return Drinks(id: d.documentID,
                                          name: d["name"] as? String ?? "",
                                          com0: d["com0"] as? String ?? "",
                                          com1: d["com1"] as? String ?? "",
                                          com2: d["com2"] as? String ?? "",
                                          com3: d["com3"] as? String ?? "",
                                          com4: d["com4"] as? String ?? "",
                                          com5: d["com5"] as? String ?? "",
                                          com6: d["com6"] as? String ?? "",
                                          com7: d["com7"] as? String ?? "",
                                          com8: d["com8"] as? String ?? "",
                                          com9: d["com9"] as? String ?? "",
                                          image: d["image"] as? String ?? "",
                                          notes: d["notes"] as? String ?? "")
                        }
                    }
                }
            }
        }
    }
    
    func addDrink(_ drink: Drinks, _ collectionName: String) {
        let db = Firestore.firestore()
        db.collection(collectionName).addDocument(data: ["name": drink.name, "image": drink.image, "notes": drink.notes,
                                                         "com0": drink.com0, "com1": drink.com1, "com2": drink.com2,
                                                         "com3": drink.com3, "com4": drink.com4, "com5": drink.com3,
                                                         "com6": drink.com6, "com7": drink.com7, "com8": drink.com8,
                                                         "com9": drink.com9]) { error in
            if error == nil  {
                self.getDrinks(collectionName)
            } else {
                
            }
        }
    }
}
