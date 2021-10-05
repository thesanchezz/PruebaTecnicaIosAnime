//  Created by jsn with love for you.
//
//  HomeRouter.swift
//  Kromasol
//
//  Created by Developer on 2021.
//

import Foundation

class HomeRouter: HomeRouterProtocol {
    var entry: EntryPointHome?
    
    static func createModule() -> HomeRouterProtocol {
        let router = HomeRouter()
        
        // MARK: Assign VIP
        var view: HomeViewProtocol = HomeViewController.instantiate(storyboard: "HomeView")
        var interactor: HomeInteractorProtocol = HomeInteractor()
        var presenter: HomePresenterProtocol = HomePresenter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.entry = view as? EntryPointHome
        
        return router
    }
     
}
