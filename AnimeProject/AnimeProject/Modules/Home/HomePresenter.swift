//  Created by CS.
//
//  HomePresenter.swift
//  AnimeProject
//
//  Created by Developer on 2021.
//

import Foundation

class HomePresenter {
    private var tableDataContainer: [CellEntitie]?
    private var popularList: [PopularAnimeEntitie]?
    private var seasonLaterList: [SeasonLaterAnimeEntitie]?
    
    //MARK: - protocolos
    var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
    
    private func prepareData() {
        var tableData: [CellEntitie] = []
        tableData.append((CellEntitie(JSON: [
            "id": HomePropertiesCell.titleSection.rawValue,
            "data": ["name": "Lo más popular", "color":"#DB0032"]
        ])!))
        tableData.append((CellEntitie(JSON: ["id": HomePropertiesCell.slider.rawValue])!))
        
        tableData.append((CellEntitie(JSON: [
            "id": HomePropertiesCell.titleSection.rawValue,
            "data": ["name": "Próximas temporadas", "color":"#662482"]
        ])!))
        
        if self.seasonLaterList != nil {
            seasonLaterList?.enumerated().forEach({ (index, value) in
                tableData.append((CellEntitie(JSON: ["id": HomePropertiesCell.anime.rawValue, "data": value.toJSON(), "indexExtra": index])!))
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
extension HomePresenter: HomePresenterProtocol {
    
    func loadPopularAnimeList() {
        prepareData()
        
        interactor?.getPopularAnime()
        interactor?.getSeasonLater()
    }
    
    func cellListId() -> [String] {
        return HomePropertiesCell.allItems.map { $0.properties.idCell }
    }
    
    func numberOfRowsInSection() -> Int {
        guard let tableDataContainer = self.tableDataContainer else {
            return 0
        }
        
        return tableDataContainer.count
    }
    
    func cellProperties(index: Int) -> HomePropertiesCell? {
        guard let tableDataContainer = self.tableDataContainer else {
            return .none
        }
        
        let cellidentifier = HomePropertiesCell.init(rawValue: tableDataContainer[index].id ?? "")
        return cellidentifier
    }
    
    func dataOfRows(index: Int) -> Any? {
        let item = tableDataContainer?[index]
        
        return item?.data
    }
    
    func detaildAnime(id: Int) {
        let vc = DetaildRouter.createModule(id: id).entry
        router?.presentModule(to: vc)
    }
    
    func topAnime() -> [PopularAnimeEntitie]? {
        return popularList
    }
    
    func seasonLater(index: Int) -> SeasonLaterAnimeEntitie? {
        let seasonLaterIndex = tableDataContainer?[index].indexExtra ?? 0
        
        return seasonLaterList?[seasonLaterIndex]
    }
    
    func popularAnimeList(with result: Result<[PopularAnimeEntitie], Error>) {
        switch result {
        case .success(let popularList):
            self.popularList = popularList
            prepareData()
        case .failure(let error):
            view?.update(with: error.localizedDescription)
        }
    }
    
    func seasonLaterList(with result: Result<[SeasonLaterAnimeEntitie], Error>) {
        switch result {
        case .success(let seasonLaterList):
            self.seasonLaterList = seasonLaterList
            prepareData()
        case .failure(let error):
            view?.update(with: error.localizedDescription)
        }
    }
}
