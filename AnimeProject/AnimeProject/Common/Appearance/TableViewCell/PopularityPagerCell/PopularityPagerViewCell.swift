//
//  PopularityPagerCell.swift
//  AnimeProject
//
//  Created by Cristian Sanchez on 5/10/21.
//

import UIKit
import FSPagerView

class PopularityPagerViewCell: UITableViewCell {
    
    @IBOutlet weak var pagerView: FSPagerView! {
        didSet {
            pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            pagerView.dataSource = self
            pagerView.delegate = self
            pagerView.transformer = FSPagerViewTransformer(type: .linear)
            let transform = CGAffineTransform(scaleX: 0.6, y: 1)
            pagerView.itemSize = pagerView.frame.size.applying(transform)
        }
    }
    
    fileprivate let imageNames = ["capturas","capturas","capturas"]
    
    static let height: CGFloat = 160.0

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpUI()
        // Initialization code
    }
    
    private func setUpUI() {
        selectionStyle = .none
        pagerView.reloadData()
        //backgroundColor = .clear
    }
    
    /*func setUp(data: MejoraTuPlanRentabilizacionModel?) {
        guard let existsData = data else {
            return
        }
        
        titleLbl.text = existsData.title
    }*/
    
}
extension PopularityPagerViewCell: FSPagerViewDataSource, FSPagerViewDelegate {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return imageNames.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named: imageNames[index])
        return cell
    }
}
