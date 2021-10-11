//  Created by CS.
//
//  SearchViewController.swift
//  AnimeProject
//
//  Created by Developer on 2021.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak private var searchBar: UISearchBar!
    @IBOutlet weak private var tableView: UITableView!

    // MARK: - Presenter
    var presenter: SearchPresenterProtocol?

    // MARK: - Fucntions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    // MARK: - init view controller
    private func setup(){
        setNavbar(type: .logo)
        setUpTable()
    }
    
    private func setUpTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        searchBar.delegate = self
        tableView.tableHeaderView = searchBar
        
        tableView.setup(cells: presenter?.cellListId() ?? [])
    }
    
}

extension SearchViewController: SearchViewProtocol {
    func update() {
        tableView.reloadData()
    }
    
    func update(with error: String) {
        showAlert(alertMessage: error)
    }
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let propertiesCell: SearchPropertiesCell = (presenter?.cellItenfier(index: indexPath.row))!
        
        switch propertiesCell {
        case .anime:
            let cell = tableView.dequeueReusableCell(withIdentifier: propertiesCell.properties.idCell, for: indexPath) as! ItemAnimeCell
            cell.setUp(anime: presenter?.itemAnime(index: indexPath.row))
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let propertiesCell: SearchPropertiesCell = (presenter?.cellItenfier(index: indexPath.row))!
        return propertiesCell.properties.height ?? 0.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = presenter?.itemAnime(index: indexPath.row)
        
        presenter?.detaildAnime(id: data?.mal_id ?? 0)
    }
    
}
extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        presenter?.listAnimesSearch(text: (searchBar.text ?? "").lowercased())
    }
    
}
