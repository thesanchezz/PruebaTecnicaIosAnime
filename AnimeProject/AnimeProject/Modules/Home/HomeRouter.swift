//  Created by CS.
//
//  HomeRouter.swift
//  AnimeProject
//
//  Created by Developer on 2021.
//

import Foundation
import UIKit

class HomeRouter {
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
extension HomeRouter: HomeRouterProtocol {
    func presentModule(to destination: UIViewController?) {
        guard let vc = destination else {
            return
        }
        
        let initController = UINavigationController(rootViewController: vc)
        entry?.presenterFull(initController, animated: true, completion: nil)
    }
}
