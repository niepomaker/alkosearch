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
}
