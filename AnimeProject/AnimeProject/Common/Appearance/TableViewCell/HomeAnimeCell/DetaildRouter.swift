//  Created by jsn with love for you.
//
//  DetaildRouter.swift
//  Kromasol
//
//  Created by Developer on 2021.
//

import Foundation

class DetaildRouter: DetaildRouterProtocol {
    var entry: EntryPointDetaild?
    
    static func createModule() -> DetaildRouterProtocol {
        let router = DetaildRouter()
        
        // MARK: Assign VIP
        var view: DetaildViewProtocol = DetaildViewController.instantiate(storyboard: "DetaildView")
        var interactor: DetaildInteractorProtocol = DetaildInteractor()
        var presenter: DetaildPresenterProtocol = DetaildPresenter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.entry = view as? EntryPointDetaild
        
        return router
    }
     
}
