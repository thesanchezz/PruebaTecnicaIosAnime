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
    
    // INTERACTOR -> PRESENTER
    func popularAnimeList(with result: Result<[PopularAnimeEntitie], Error>)
}
