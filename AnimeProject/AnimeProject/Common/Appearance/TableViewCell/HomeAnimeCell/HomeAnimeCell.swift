//
//  HomeAnimeCell.swift
//  AnimeProject
//
//  Created by Cristian Sanchez on 5/10/21.
//

import UIKit

class HomeAnimeCell: UITableViewCell {
    
    static let height: CGFloat = 120.0

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }
    
    private func setUpUI() {
        selectionStyle = .none
    }
    
}
