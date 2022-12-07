//
//  ViewCamera.swift
//  AlkoSearch
//
//  Created by Łukasz Paprot on 01/12/2022.
//

import Foundation
import UIKit

class ViewCamera: ObservableObject {
    @Published var image: UIImage?
    @Published var showPicker = false
    @Published var source: Picker.Source = .library 
}
