//  Created by CS.
//
//  DetaildViewController.swift
//  AnimeProject
//
//  Created by Developer on 2021.
//

import UIKit

class DetaildViewController: UIViewController, DetaildViewProtocol {

    // MARK: - IBOutlets

    // MARK: - Presenter
    var presenter: DetaildPresenterProtocol?

    // MARK: - Fucntions
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    // MARK: - init view controller
    private func setup(){
        
    }

}
