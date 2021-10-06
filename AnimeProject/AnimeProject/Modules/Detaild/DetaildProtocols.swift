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
    
    static func createModule() -> DetaildRouterProtocol
}

// MARK: - View Protocol
protocol DetaildViewProtocol {
    var presenter: DetaildPresenterProtocol? { get set }
    
}

// MARK: - Interactor Protocol
protocol DetaildInteractorProtocol {
    var presenter: DetaildPresenterProtocol? { get set }
    
}

// MARK: - Presenter Protocol
protocol DetaildPresenterProtocol {
    var router: DetaildRouterProtocol? { get set }
    var interactor: DetaildInteractorProtocol? { get set }
    var view: DetaildViewProtocol? { get set }
    
}
