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
        showLoading()
        setUpTable()
        presenter?.loadPopularAnimeList()
        
        setUpCustomNavBar()
    }
    
    private func setUpTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        tableView.setup(cells: presenter?.cellListId() ?? [])
    }
    
    func setUpCustomNavBar(){
        let logo = UIImage(named: "anime-logo")
        let imageView = UIImageView(image:logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
        
        let messageButton = UIButton(type: .system)
        messageButton.setImage(UIImage(named: "search")?.withRenderingMode(.alwaysOriginal), for: .normal)
        messageButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: messageButton)
        
        let rightBarButtonItem = UIBarButtonItem()
        rightBarButtonItem.customView = messageButton
        navigationItem.setRightBarButton(rightBarButtonItem, animated: false)
    }

}
extension HomeViewController: HomeViewProtocol {
    func update() {
        hideLoading()
        tableView.reloadData()
    }
    
    func update(with error: String) {
        hideLoading()
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
            cell.setUp(data: TitleSectionEntitie(JSON: data as! [String: Any])!)
            return cell
        case .pager:
            let cell = tableView.dequeueReusableCell(withIdentifier: propertiesCell.properties.idCell, for: indexPath) as! PopularityPagerViewCell
            return cell
        case .anime:
            let cell = tableView.dequeueReusableCell(withIdentifier: propertiesCell.properties.idCell, for: indexPath) as! HomeAnimeCell
            return cell
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let propertiesCell: HomePropertiesCell = (presenter?.cellProperties(index: indexPath.row))!
        switch propertiesCell {
        case .pager:
            return view.frame.width - 100
        case .anime, .titleSection:
            return propertiesCell.properties.height ?? 0
        }
    }
    
}
