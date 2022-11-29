//
//  AlkoSearchApp.swift
//  AlkoSearch
//
//  Created by Łukasz Paprot on 17/11/2022.
//

import SwiftUI
import Firebase

@main
struct AlkoSearchApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            
            mainView()
        }
    }
}
