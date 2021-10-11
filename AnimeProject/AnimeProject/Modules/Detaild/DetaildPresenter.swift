//  Created by CS.
//
//  DetaildPresenter.swift
//  AnimeProject
//
//  Created by Developer on 2021.
//

import Foundation

class DetaildPresenter {
    
    //MARK: - protocolos
    var view: DetaildViewProtocol?
    var interactor: DetaildInteractorProtocol?
    var router: DetaildRouterProtocol?

}
extension DetaildPresenter: DetaildPresenterProtocol {
    func dataOfAnime() {
        interactor?.getDetaild()
    }
    
    func close() {
        router?.close()
    }
    
    func detaildAnime(with result: Result<DetaildAnimeEntitie, Error>) {
        switch result {
        case .success(let anime):
            view?.update(anime: anime)
        case .failure(let error):
            view?.update(with: error.localizedDescription)
        }
    }
}
