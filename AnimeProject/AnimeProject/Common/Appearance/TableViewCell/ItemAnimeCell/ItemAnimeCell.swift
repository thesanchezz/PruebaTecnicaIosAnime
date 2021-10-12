//
//  ItemAnimeCell.swift
//  AnimeProject
//
//  Created by Cristian Sanchez on 5/10/21.
//

import UIKit
import SkeletonView

class ItemAnimeCell: UITableViewCell {
    
    @IBOutlet weak private var imagenProduc: UIImageView!
    @IBOutlet weak private var nameLbl: UILabel!
    @IBOutlet weak private var synopsis: UILabel!
    
    private var animeData: SeasonLaterAnimeEntitie?
    static let height: CGFloat = 120.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imagenProduc.image = nil
    }
    
    private func setUpUI() {
        selectionStyle = .none
    }
    
    func setUp(anime: SeasonLaterAnimeEntitie?) {
        animeData = anime
        guard let animeData = self.animeData else {
            imagenProduc.showSkeleton()
            nameLbl.showSkeleton()
            return
        }
        
        imagenProduc.hideSkeleton()
        nameLbl.hideSkeleton()
        
        nameLbl.text = animeData.title
        synopsis.text = animeData.synopsis
        DispatchQueue.main.async {
            self.imagenProduc.loadImage(urlString: animeData.image_url ?? "")
        }
    }
    
}
