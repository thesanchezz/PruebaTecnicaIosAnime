//
//  UICollectionView+Extension.swift
//  AnimeProject
//
//  Created by Cristian Sanchez on 9/10/21.
//

import UIKit

extension UICollectionView {
    func setup(cells: [String]) {
        cells.forEach { (cell) in
            self.register(UINib(nibName: cell, bundle: nil), forCellWithReuseIdentifier: cell)
        }
    }
}
