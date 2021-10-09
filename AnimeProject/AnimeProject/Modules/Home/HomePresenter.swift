//  Created by CS.
//
//  HomePresenter.swift
//  AnimeProject
//
//  Created by Developer on 2021.
//

import Foundation

class HomePresenter {
    private var popularList: [PopularAnimeEntitie]?
    private var tableDataContainer: [CellEntitie]?
    
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
        tableData.append((CellEntitie(JSON: ["id": HomePropertiesCell.pager.rawValue])!))
        
        tableData.append((CellEntitie(JSON: [
            "id": HomePropertiesCell.titleSection.rawValue,
            "data": ["name": "Otros", "color":"#662482"]
        ])!))
        
        tableData.append((CellEntitie(JSON: ["id": HomePropertiesCell.anime.rawValue])!))
        tableData.append((CellEntitie(JSON: ["id": HomePropertiesCell.anime.rawValue])!))
        
        tableDataContainer = tableData
        
        view?.update()
    }

}
extension HomePresenter: HomePresenterProtocol {
    func loadPopularAnimeList() {
        interactor?.getPopularAnime()
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
    
    func popularAnimeList(with result: Result<[PopularAnimeEntitie], Error>) {
        switch result {
        case .success(let popularList):
            self.popularList = popularList
            prepareData()
        case .failure(let error):
            view?.update(with: error.localizedDescription)
        }
    }
}
