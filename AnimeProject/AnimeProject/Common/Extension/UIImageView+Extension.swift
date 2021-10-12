//
//  UIImageView+Extension.swift
//  AnimeProject
//
//  Created by Cristian Sanchez on 9/10/21.
//

import UIKit
import SDWebImage

extension UIImageView {
    func loadImage(urlString: String) {
        if let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
           let url = URL(string: encoded) {
            DispatchQueue.main.async {
                self.sd_imageIndicator = SDWebImageActivityIndicator.gray
                self.sd_setImage(with: url)
            }
        }
    }
    
}
