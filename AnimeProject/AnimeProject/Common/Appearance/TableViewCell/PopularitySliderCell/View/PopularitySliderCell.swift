//
//  PopularitySliderCell.swift
//  AnimeProject
//
//  Created by Cristian Sanchez on 9/10/21.
//

import UIKit

class PopularitySliderCell: UITableViewCell {

    @IBOutlet weak private var contentList: UIView!
    
    private let collectionProducts: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        let collectionProducts = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionProducts.setup(cells: [AnimeItemSlideCell.cellIdentifier])
        collectionProducts.backgroundColor = .black
        return collectionProducts
    }()
    
    static let height: CGFloat = 200.0
    private weak var delegate: PopularitySliderDelegateCell?
    private var listAnime: [PopularAnimeEntitie]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        selectionStyle = .none
        backgroundColor = .clear
        
        setUpCollection()
    }
    
    private func setUpCollection() {
        contentList.addSubview(collectionProducts)
        collectionProducts.backgroundColor = .white
        collectionProducts.delegate = self
        collectionProducts.dataSource = self
        collectionProducts.frame = contentList.frame
        collectionProducts.indexDisplayMode = .alwaysHidden
        collectionProducts.showsHorizontalScrollIndicator = false
        collectionProducts.showsVerticalScrollIndicator = false
        collectionProducts.alwaysBounceHorizontal = false
    }
    
    private func dataOfRows(index: Int) -> PopularAnimeEntitie? {
        guard let listAnime = self.listAnime else {
            return nil
        }
        
        return listAnime[index]
    }
    
    func setUp(delegate: PopularitySliderDelegateCell, data: [PopularAnimeEntitie]?) {
        self.delegate = delegate
        listAnime = data
        collectionProducts.reloadData()
    }
    
}
extension PopularitySliderCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listAnime?.count ?? 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnimeItemSlideCell.cellIdentifier, for: indexPath) as! AnimeItemSlideCell
        cell.setUp(anime: dataOfRows(index: indexPath.row))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 95.0, height: 190.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.goToAnime(index: listAnime?[indexPath.row].mal_id ?? 1)
    }
    
}
