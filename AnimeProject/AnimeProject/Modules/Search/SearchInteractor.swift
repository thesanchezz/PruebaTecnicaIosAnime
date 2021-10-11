//  Created by CS.
//
//  SearchInteractor.swift
//  AnimeProject
//
//  Created by Developer on 2021.
//

import Foundation

class SearchInteractor: SearchInteractorProtocol {
    var presenter: SearchPresenterProtocol?
    
    func getAnimesSearch(text: String) {
        AnimeRepository.shared.getSearch(search: text) { result in
            self.presenter?.searchAnimeList(with: result)
        }
    }
}

