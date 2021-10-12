//
//  SearchPropertiesCell.swift
//  AnimeProject
//
//  Created by Cristian Sanchez on 10/10/21.
//

import UIKit

enum SearchPropertiesCell: String {
    case anime
    
    typealias itemProperties = (idCell: String, height: CGFloat?)
    
    var properties: itemProperties {
        switch self {
        case .anime:
            return (idCell: ItemAnimeCell.identifier, height: ItemAnimeCell.height)
        }
    }
    
    static let allItems = [anime]
}

