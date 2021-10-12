//
//  TitleSectionCell.swift
//  AnimeProject
//
//  Created by Cristian Sanchez on 9/10/21.
//

import UIKit
import SkeletonView

class TitleSectionCell: UITableViewCell {

    @IBOutlet private weak var contenTitle: UIView!
    @IBOutlet private weak var titlelbl: UILabel!
    
    static let height: CGFloat = 70.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpUI()
        // Initialization code
    }
    
    private func setUpUI() {
        selectionStyle = .none
        backgroundColor = .clear
        titlelbl.textColor = .white
    }
    
    func setUp(data: TitleSectionEntitie, loading: Bool) {
        guard !loading else {
            contenTitle.showSkeleton()
            return
        }
        
        contenTitle.hideSkeleton()
        
        titlelbl.text = data.name?.uppercased()
        
        let hexColor = UIColor(data.color!)
        contenTitle.backgroundColor = hexColor
    }
    
}
