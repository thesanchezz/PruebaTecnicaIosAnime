//
//  UICollectionViewCell+Extension.swift
//  AnimeProject
//
//  Created by Cristian Sanchez on 9/10/21.
//

import UIKit

extension UICollectionViewCell {
    static var cellIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
