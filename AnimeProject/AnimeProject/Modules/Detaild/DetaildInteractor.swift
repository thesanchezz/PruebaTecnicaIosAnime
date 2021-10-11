//  Created by CS.
//
//  DetaildInteractor.swift
//  AnimeProject
//
//  Created by Developer on 2021.
//

import Foundation

class DetaildInteractor {
    var presenter: DetaildPresenterProtocol?
    var id: Int?
    
}

extension DetaildInteractor: DetaildInteractorProtocol {
    func getDetaild() {
        AnimeRepository.shared.getDetaild(id: id ?? 0) { result in
            self.presenter?.detaildAnime(with: result)
        }
    }
}
