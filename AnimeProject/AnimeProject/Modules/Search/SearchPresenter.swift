//  Created by CS.
//
//  SearchPresenter.swift
//  AnimeProject
//
//  Created by Developer on 2021.
//

import Foundation

class SearchPresenter {
    private var tableDataContainer: [CellEntitie]?
    private var searchResultList: [SeasonLaterAnimeEntitie]?
    
    //MARK: - protocolos
    var view: SearchViewProtocol?
    var interactor: SearchInteractorProtocol?
    var router: SearchRouterProtocol?
    
    private func prepareData() {
        var tableData: [CellEntitie] = []
        
        if searchResultList != nil {
            searchResultList?.forEach({ value in
                tableData.append((CellEntitie(JSON: ["id": HomePropertiesCell.anime.rawValue, "data": value.toJSON()])!))
            })
        }else {
            for _ in 0...4 {
                tableData.append((CellEntitie(JSON: ["id": HomePropertiesCell.anime.rawValue])!))
            }
        }
        
        tableDataContainer = tableData
        view?.update()
    }
}

extension SearchPresenter: SearchPresenterProtocol {
   
    func listAnimesSearch(text: String) {
        prepareData()
        interactor?.getAnimesSearch(text: text)
    }

    func cellListId() -> [String] {
        return SearchPropertiesCell.allItems.map { $0.properties.idCell }
    }
    
    func numberOfRowsInSection() -> Int {
        guard let tableDataContainer = self.tableDataContainer else {
            return 0
        }
        
        return tableDataContainer.count
    }
    
    func cellItenfier(index: Int) -> SearchPropertiesCell? {
        guard let tableDataContainer = self.tableDataContainer else {
            return .none
        }
        
        let cellidentifier = SearchPropertiesCell.init(rawValue: tableDataContainer[index].id ?? "")
        
        return cellidentifier
    }
    
    func itemAnime(index: Int) -> SeasonLaterAnimeEntitie? {
        guard let data = tableDataContainer?[index].data else {
            return nil
        }
        
        return SeasonLaterAnimeEntitie(JSON: data as! [String : Any])
    }

    func searchAnimeList(with result: Result<[SeasonLaterAnimeEntitie], Error>) {
        switch result {
        case .success(let searchResultList):
            self.searchResultList = searchResultList
            prepareData()
        case .failure(let error):
            view?.update(with: error.localizedDescription)
        }
    }
    
    func detaildAnime(id: Int) {
        let vc = DetaildRouter.createModule(id: id).entry
        router?.presentModule(to: vc)
    }
    
}
