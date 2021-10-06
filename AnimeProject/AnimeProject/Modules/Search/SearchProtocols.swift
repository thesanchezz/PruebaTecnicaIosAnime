//  Created by jsn with love for you.
//
//  SearchProtocols.swift
//  Kromasol
//
//  Created by Developer on 2021.
//

import UIKit

typealias EntryPointSearch = SearchViewProtocol & UIViewController

// MARK: - Router Protocol
protocol SearchRouterProtocol {
    var entry: EntryPointSearch? { get }
    
    static func createModule() -> SearchRouterProtocol
}

// MARK: - View Protocol
protocol SearchViewProtocol {
    var presenter: SearchPresenterProtocol? { get set }
    
}

// MARK: - Interactor Protocol
protocol SearchInteractorProtocol {
    var presenter: SearchPresenterProtocol? { get set }
    
}

// MARK: - Presenter Protocol
protocol SearchPresenterProtocol {
    var router: SearchRouterProtocol? { get set }
    var interactor: SearchInteractorProtocol? { get set }
    var view: SearchViewProtocol? { get set }
    
}
