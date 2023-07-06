//
//  DataService.swift
//  Recipe List App
//
//  Created by Łukasz Paprot on 13/12/2022.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Images] {
        let pathString = Bundle.main.path(forResource: "images", ofType: "json")
        
        //Check if pathString is not nil, otherwise...
        guard pathString != nil else {
            return [Images]()
        }
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Images].self, from: data)
                for r in recipeData {
                    r.id = UUID()
                }
                return recipeData
            } catch {
                print(error)
            }   
        } catch {
            print(error)
        }
        
        return [Images]()
        
    }
}
