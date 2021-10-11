//  Created by CS.
//
//  HomeProtocols.swift
//  AnimeProject
//
//  Created by Developer on 2021.
//

import UIKit

typealias EntryPointHome = HomeViewProtocol & UIViewController

// MARK: - Router Protocol
protocol HomeRouterProtocol {
    var entry: EntryPointHome? { get }
    
    static func createModule() -> HomeRouterProtocol
    
    //Presenter -> Router
    func presentModule(to destination: UIViewController?)
}

// MARK: - View Protocol
protocol HomeViewProtocol {
    var presenter: HomePresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func update()
    func update(with error: String)
}

// MARK: - Interactor Protocol
protocol HomeInteractorProtocol {
    var presenter: HomePresenterProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func getPopularAnime()
    func getSeasonLater()
}

// MARK: - Presenter Protocol
protocol HomePresenterProtocol {
    var router: HomeRouterProtocol? { get set }
    var interactor: HomeInteractorProtocol? { get set }
    var view: HomeViewProtocol? { get set }
    
    // VIEW -> PRESENTER
    func loadPopularAnimeList()
    func cellListId() -> [String]
    func numberOfRowsInSection() -> Int
    func cellProperties(index: Int) -> HomePropertiesCell?
    func topAnime() -> [PopularAnimeEntitie]?
    func seasonLater(index: Int) -> SeasonLaterAnimeEntitie?
    func dataOfRows(index: Int) -> Any?
    func detaildAnime(id: Int)
    
    // INTERACTOR -> PRESENTER
    func popularAnimeList(with result: Result<[PopularAnimeEntitie], Error>)
    func seasonLaterList(with result: Result<[SeasonLaterAnimeEntitie], Error>)
}
