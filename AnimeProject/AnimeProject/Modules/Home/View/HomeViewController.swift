//  Created by jsn with love for you.
//
//  HomeViewController.swift
//  Kromasol
//
//  Created by Developer on 2021.
//

import UIKit

class HomeViewController: UIViewController, HomeViewProtocol {

    // MARK: - IBOutlets

    // MARK: - Presenter
    var presenter: HomePresenterProtocol?

    // MARK: - Fucntions
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    // MARK: - init view controller
    private func setup(){
        
    }

}
