//
//  AnimeItemSlideCell.swift
//  AnimeProject
//
//  Created by Cristian Sanchez on 9/10/21.
//

import UIKit
import SkeletonView

class AnimeItemSlideCell: UICollectionViewCell {
    
    @IBOutlet weak private var contentSlide: UIView!
    @IBOutlet weak private var contenImagen: UIView!
    @IBOutlet weak private var imagenProduc: UIImageView!
    @IBOutlet weak private var nameLbl: UILabel!
    
    private var animeData: PopularAnimeEntitie?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpUi()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imagenProduc.image = nil
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes)
        -> UICollectionViewLayoutAttributes {
      return layoutAttributes
    }
    
    private func setUpUi() {
        contenImagen.layer.cornerRadius = 10
        contenImagen.clipsToBounds = true
        imagenProduc.clipsToBounds = false
    }
    
    func setUp(anime: PopularAnimeEntitie?) {
        animeData = anime
        guard let animeData = self.animeData else {
            contentSlide.showSkeleton()
            return
        }
        
        contentSlide.hideSkeleton()
        
        nameLbl.text = animeData.title
        DispatchQueue.main.async {
            self.imagenProduc.loadImage(urlString: animeData.image_url ?? "")
        }
    }

}
