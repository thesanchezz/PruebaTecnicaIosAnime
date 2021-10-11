//  Created by CS.
//
//  DetaildRouter.swift
//  AnimeProject
//
//  Created by Developer on 2021.
//

import Foundation

class DetaildRouter {
    var entry: EntryPointDetaild?
    
    static func createModule(id: Int) -> DetaildRouterProtocol {
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
        interactor.id = id
        
        router.entry = view as? EntryPointDetaild
        
        return router
    }
     
}
extension DetaildRouter: DetaildRouterProtocol {
    func close() {
        entry?.dismiss(animated: true, completion: nil)
    }
}
