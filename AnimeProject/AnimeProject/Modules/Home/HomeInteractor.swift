//  Created by CS.
//
//  HomeInteractor.swift
//  AnimeProject
//
//  Created by Developer on 2021.
//

import Foundation

class HomeInteractor {
    var presenter: HomePresenterProtocol?
    
}

extension HomeInteractor: HomeInteractorProtocol {
    func getPopularAnime() {
        AnimeRepository.shared.getPopularityList { result in
            self.presenter?.popularAnimeList(with: result)
        }
    }
    
    func getSeasonLater() {
        AnimeRepository.shared.getSeasonLater { result in
            self.presenter?.seasonLaterList(with: result)
        }
    }
    
}


