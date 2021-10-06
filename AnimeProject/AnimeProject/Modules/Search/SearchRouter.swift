//  Created by jsn with love for you.
//
//  SearchRouter.swift
//  Kromasol
//
//  Created by Developer on 2021.
//

import Foundation

class SearchRouter: SearchRouterProtocol {
    var entry: EntryPointSearch?
    
    static func createModule() -> SearchRouterProtocol {
        let router = SearchRouter()
        
        // MARK: Assign VIP
        var view: SearchViewProtocol = SearchViewController.instantiate(storyboard: "SearchView")
        var interactor: SearchInteractorProtocol = SearchInteractor()
        var presenter: SearchPresenterProtocol = SearchPresenter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.entry = view as? EntryPointSearch
        
        return router
    }
     
}
