//
//  ItemsTabBar.swift
//  AnimeProject
//
//  Created by Cristian Sanchez on 4/10/21.
//

import UIKit

enum ItemsTabBar {
    case vc1
    
    private typealias itemProperties = (selectedImage: String, deselectedImage: String, vc: UIViewController?)
    
    private var properties: itemProperties {
        switch self {
        case .vc1:
            return (selectedImage: "home-selected", deselectedImage: "home", vc: nil)
        }
    }
    
    static let allItems = [vc1]
}
