//  Created by CS.
//
//  SearchProtocols.swift
//  AnimeProject
//
//  Created by Developer on 2021.
//

import UIKit

typealias EntryPointSearch = SearchViewProtocol & UIViewController

// MARK: - Router Protocol
protocol SearchRouterProtocol {
    var entry: EntryPointSearch? { get }
    
    static func createModule() -> SearchRouterProtocol
    
    //Presenter -> Router
    func presentModule(to destination: UIViewController?)
}

// MARK: - View Protocol
protocol SearchViewProtocol {
    var presenter: SearchPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func update()
    func update(with error: String)
}

// MARK: - Interactor Protocol
protocol SearchInteractorProtocol {
    var presenter: SearchPresenterProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func getAnimesSearch(text: String)
}

// MARK: - Presenter Protocol
protocol SearchPresenterProtocol {
    var router: SearchRouterProtocol? { get set }
    var interactor: SearchInteractorProtocol? { get set }
    var view: SearchViewProtocol? { get set }
    
    // VIEW -> PRESENTER
    func listAnimesSearch(text: String)
    func cellListId() -> [String]
    func numberOfRowsInSection() -> Int
    func cellItenfier(index: Int) -> SearchPropertiesCell?
    func itemAnime(index: Int) -> SeasonLaterAnimeEntitie?
    func detaildAnime(id: Int)
    
    // INTERACTOR -> PRESENTER
    func searchAnimeList(with result: Result<[SeasonLaterAnimeEntitie], Error>)
}
