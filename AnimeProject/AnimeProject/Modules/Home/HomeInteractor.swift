//  Created by jsn with love for you.
//
//  HomeInteractor.swift
//  Kromasol
//
//  Created by Developer on 2021.
//

import Foundation

class HomeInteractor: HomeInteractorProtocol {
    var presenter: HomePresenterProtocol?
    
    func getPopularAnime() {
        AnimeRepository.shared.getPopularityList { result in
            self.presenter?.popularAnimeList(with: result)
        }
    }
    
}

