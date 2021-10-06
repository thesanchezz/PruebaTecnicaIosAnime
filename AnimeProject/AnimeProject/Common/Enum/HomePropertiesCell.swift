//
//  HomePropertiesCell.swift
//  AnimeProject
//
//  Created by Cristian Sanchez on 5/10/21.
//

import UIKit

enum HomePropertiesCell: String {
    case pager
    case anime
    
    typealias itemProperties = (idCell: String, height: CGFloat?)
    
    var properties: itemProperties {
        switch self {
        case .pager:
            return (idCell: PopularityPagerViewCell.identifier, height: PopularityPagerViewCell.height)
        case .anime:
            return (idCell: HomeAnimeCell.identifier, height: HomeAnimeCell.height)
        }
    }
    
    static let allItems = [pager, anime]
}
