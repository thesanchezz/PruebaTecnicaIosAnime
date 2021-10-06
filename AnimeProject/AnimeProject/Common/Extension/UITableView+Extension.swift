//
//  UITableView+Extension.swift
//  AnimeProject
//
//  Created by Cristian Sanchez on 5/10/21.
//

import UIKit

extension UITableView {
    func setup(cells: [String]) {
        cells.forEach { (cell) in
            self.register(UINib(nibName: cell, bundle: nil), forCellReuseIdentifier: cell)
        }
    }
    
    func reload(rowNumber: Int, sectionNumber: Int = 0) {
        let indexPath = IndexPath(item: rowNumber, section: sectionNumber)
        self.reloadRows(at: [indexPath], with: .top)
    }
    
}
