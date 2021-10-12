//
//  NavBar.swift
//  AnimeProject
//
//  Created by Cristian Sanchez on 5/10/21.
//

import UIKit
import Foundation
import Actions

enum NavigationBarMode {
    case logo
    case logoSearch
    case presenter
}

public final class NavBar: NSObject, UIViewControllerTransitioningDelegate {
    
    private var VC: UIViewController?
    
    public init(viewController: UIViewController = UIViewController()) {
        self.VC = viewController
    }
    
    func themeNavigationBar(mode: NavigationBarMode) {
        VC?.navigationItem.rightBarButtonItems?.removeAll()
        removeBackButton()
        removeLogo()
        
        switch mode {
        case .logo:
            addLogo()
        case .logoSearch:
            logoSearch()
        case .presenter:
            presenter()
        }
    }
    
    private func removeLogo() {
        VC?.navigationController?.navigationBar.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    private func removeBackButton() {
        VC?.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
    }
    
    private func addLogo() {
        VC?.navigationController?.navigationBar.tintColor = .black
        
        let logo = UIImage(named: "anime-logo")
        let imageView = UIImageView(image:logo)
        imageView.contentMode = .scaleAspectFit
        VC?.navigationItem.titleView = imageView
    }
    
    private func logoSearch() {
        addLogo()
        
        let searchButton = UIButton(type: .system)
        searchButton.setImage(UIImage(named: "search")?.withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        searchButton.addAction {
            self.search()
        }
        VC?.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchButton)
    }
    
    private func presenter() {
        addLogo()
        
        let closeButton = UIButton(type: .system)
        closeButton.setImage(UIImage(named: "close")?.withRenderingMode(.alwaysOriginal), for: .normal)
        closeButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        closeButton.addAction {
            self.close()
        }
        VC?.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: closeButton)
    }
    
    private func close() {
        VC?.dismiss(animated: true, completion: nil)
    }
    
    private func search() {
        let vc = SearchRouter.createModule().entry!
        VC?.navigationController?.pushViewController(vc, animated: true)
    }
    
}
