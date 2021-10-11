//  Created by CS.
//
//  HomeViewController.swift
//  AnimeProject
//
//  Created by Developer on 2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak private var tableView: UITableView!

    // MARK: - Presenter
    var presenter: HomePresenterProtocol?

    // MARK: - Fucntions
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    // MARK: - init view controller
    private func setup(){
        setNavbar(type: .logoSearch)
        setUpTable()
        presenter?.loadPopularAnimeList()
        
    }
    
    private func setUpTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        tableView.setup(cells: presenter?.cellListId() ?? [])
    }

}
extension HomeViewController: HomeViewProtocol {
    func update() {
        tableView.reloadData()
    }
    
    func update(with error: String) {
        showAlert(alertMessage: error)
    }

}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let propertiesCell: HomePropertiesCell = (presenter?.cellProperties(index: indexPath.row))!
        let data = presenter?.dataOfRows(index: indexPath.row)
        
        switch propertiesCell {
        case .titleSection:
            let cell = tableView.dequeueReusableCell(withIdentifier: propertiesCell.properties.idCell, for: indexPath) as! TitleSectionCell
            cell.setUp(data: TitleSectionEntitie(JSON: data as! [String: Any])!, loading: presenter?.topAnime() == nil ? true : false )
            return cell
        case .slider:
            let cell = tableView.dequeueReusableCell(withIdentifier: propertiesCell.properties.idCell, for: indexPath) as! PopularitySliderCell
            cell.setUp(delegate: self, data: presenter?.topAnime())
            return cell
        case .anime:
            let cell = tableView.dequeueReusableCell(withIdentifier: propertiesCell.properties.idCell, for: indexPath) as! ItemAnimeCell
            cell.setUp(anime: presenter?.seasonLater(index: indexPath.row))
            return cell
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let propertiesCell: HomePropertiesCell = (presenter?.cellProperties(index: indexPath.row))!
        
        return propertiesCell.properties.height ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = presenter?.seasonLater(index: indexPath.row)
        
        presenter?.detaildAnime(id: data?.mal_id ?? 0)
    }
    
}

extension HomeViewController: PopularitySliderDelegateCell {
    func goToAnime(index: Int) {
        presenter?.detaildAnime(id: index)
    }
}
