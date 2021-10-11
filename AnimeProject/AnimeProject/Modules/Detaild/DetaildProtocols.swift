//  Created by CS.
//
//  DetaildProtocols.swift
//  AnimeProject
//
//  Created by Developer on 2021.
//

import UIKit

typealias EntryPointDetaild = DetaildViewProtocol & UIViewController

// MARK: - Router Protocol
protocol DetaildRouterProtocol {
    var entry: EntryPointDetaild? { get }
    
    static func createModule(id: Int) -> DetaildRouterProtocol
    
    //Presenter -> Router
    func close()
}

// MARK: - View Protocol
protocol DetaildViewProtocol {
    var presenter: DetaildPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func update(anime: DetaildAnimeEntitie)
    func update(with error: String)
}

// MARK: - Interactor Protocol
protocol DetaildInteractorProtocol {
    var presenter: DetaildPresenterProtocol? { get set }
    var id: Int? { get set }
    
    // PRESENTER -> INTERACTOR
    func getDetaild()
}

// MARK: - Presenter Protocol
protocol DetaildPresenterProtocol {
    var router: DetaildRouterProtocol? { get set }
    var interactor: DetaildInteractorProtocol? { get set }
    var view: DetaildViewProtocol? { get set }
    
    // VIEW -> PRESENTER
    func dataOfAnime()
    func close()
    
    // INTERACTOR -> PRESENTER
    func detaildAnime(with result: Result<DetaildAnimeEntitie, Error>)
}
