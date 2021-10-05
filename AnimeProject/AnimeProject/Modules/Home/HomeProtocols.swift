//  Created by jsn with love for you.
//
//  HomeProtocols.swift
//  Kromasol
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
    
}

// MARK: - Interactor Protocol
protocol HomeInteractorProtocol {
    var presenter: HomePresenterProtocol? { get set }
    
}

// MARK: - Presenter Protocol
protocol HomePresenterProtocol {
    var router: HomeRouterProtocol? { get set }
    var interactor: HomeInteractorProtocol? { get set }
    var view: HomeViewProtocol? { get set }
    
}
