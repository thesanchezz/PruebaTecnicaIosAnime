//
//  HomePropertiesCell.swift
//  AnimeProject
//
//  Created by Cristian Sanchez on 5/10/21.
//

import UIKit

enum HomePropertiesCell: String {
    case titleSection
    case slider
    case anime
    
    typealias itemProperties = (idCell: String, height: CGFloat?)
    
    var properties: itemProperties {
        switch self {
        case .titleSection:
            return (idCell: TitleSectionCell.identifier, height: TitleSectionCell.height)
        case .slider:
            return (idCell: PopularitySliderCell.identifier, height: PopularitySliderCell.height)
        case .anime:
            return (idCell: ItemAnimeCell.identifier, height: ItemAnimeCell.height)
        }
    }
    
    static let allItems = [titleSection, slider, anime]
}
