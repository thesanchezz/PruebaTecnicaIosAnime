//  Created by CS.
//
//  SearchRouter.swift
//  AnimeProject
//
//  Created by Developer on 2021.
//

import Foundation
import UIKit

class SearchRouter {
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
extension SearchRouter: SearchRouterProtocol {
    func presentModule(to destination: UIViewController?) {
        guard let vc = destination else {
            return
        }
        
        let initController = UINavigationController(rootViewController: vc)
        entry?.presenterFull(initController, animated: true, completion: nil)
    }
}
