

import UIKit
import ProgressHUD


class HomeVC: UIViewController {

    private var cityPresenter : CityPresenter!
    
    private let tableCellIdentifier = "tableCellIdentifier"
    
    lazy private var tableView : UITableView = {
       let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confiqurenavigationBar()
        configureViews()
        addSubViews()
        setupLayoutConstraint()
        configureTableView()
        fetchData()
    }
    private func configureViews(){
        view.backgroundColor = .systemOrange
        
    }
    private func addSubViews(){
        view.addSubview(tableView)
    }
    private func confiqurenavigationBar(){
        title = "Nearest Cities to Brussels"
      
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    private func setupLayoutConstraint(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
    private func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CityTableCell.self, forCellReuseIdentifier: tableCellIdentifier)
    }
    private func fetchData(){
        cityPresenter = CityPresenter(self)
        cityPresenter.featchData()
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityPresenter.numberOfRowsInSection()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableCellIdentifier, for: indexPath) as! CityTableCell
        cityPresenter.configureCell(cell, for: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        125
    }
}

extension HomeVC: ViewProtocol{
    func fetchDataSucces() {
        tableView.reloadData()
    }
    func showActivity() {
        ProgressHUD.animate("Loading ...")
        ProgressHUD.animationType = .activityIndicator
    }
    func hideActivity() {
        ProgressHUD.dismiss()
    }
    
    
}

