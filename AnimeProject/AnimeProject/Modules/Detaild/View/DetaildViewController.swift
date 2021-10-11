//  Created by CS.
//
//  DetaildViewController.swift
//  AnimeProject
//
//  Created by Developer on 2021.
//

import UIKit
import SkeletonView

class DetaildViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak private var imageAnime: UIImageView!
    @IBOutlet weak private var nameAnime: UILabel!
    @IBOutlet weak private var synopsis: UILabel!
    
    // MARK: - Presenter
    var presenter: DetaildPresenterProtocol?

    // MARK: - Fucntions
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    // MARK: - init view controller
    private func setup(){
        setNavbar(type: .presenter)
        presenter?.dataOfAnime()
        
        skeleton(show: true)
    }
    
    private func skeleton(show: Bool) {
        show ? imageAnime.showSkeleton() : imageAnime.hideSkeleton()
        show ? nameAnime.showSkeleton() : nameAnime.hideSkeleton()
        show ? synopsis.showSkeleton() : synopsis.hideSkeleton()
    }
    
}

extension DetaildViewController: DetaildViewProtocol {
    func update(anime: DetaildAnimeEntitie) {
        skeleton(show: false)
        
        nameAnime.text = anime.title
        synopsis.text = anime.synopsis
        
        imageAnime.loadImage(urlString: anime.image_url ?? "")
    }
    
    func update(with error: String) {
        showAlert(alertMessage: error)
    }
    
}
