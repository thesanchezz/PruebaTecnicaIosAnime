//  Created by jsn with love for you.
//
//  SearchViewController.swift
//  Kromasol
//
//  Created by Developer on 2021.
//

import UIKit

class SearchViewController: UIViewController, SearchViewProtocol {

    // MARK: - IBOutlets

    // MARK: - Presenter
    var presenter: SearchPresenterProtocol?

    // MARK: - Fucntions
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    // MARK: - init view controller
    private func setup(){
        
    }

}
