//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Łukasz Paprot on 13/12/2022.
//

import Foundation

class ImageModel: ObservableObject {
    @Published var images = [Images]()
    
    init() {
        //Create an instance of data service and get the data
        self.images = DataService.getLocalData()
    }
}
