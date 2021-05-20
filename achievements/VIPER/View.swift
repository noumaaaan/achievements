//
//  View.swift
//  achievements
//
//  Created by Nouman on 16/05/2021.
//

import Foundation
import UIKit
import Stevia

protocol AnyView {
    var presenter: AnyPresenter? { get set }
    
    func update(with achievments: [Achievement])
    func displayError(with error: String)
    func setTitle(with title: String)
}

class AchievementsView: UIViewController, AnyView {
    
    var presenter: AnyPresenter?
    var achievements: [Achievement] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBarButtons()
        configureTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    let tableView: UITableView = {
        let table = UITableView()
        table.isHidden = true
        return table
    }()
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.separatorColor = UIColor.clear
    }
    
    func setTableViewDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func update(with achievments: [Achievement]) {
        DispatchQueue.main.async {
            self.achievements = achievments
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    
    func displayError(with error: String) {
        self.achievements = []
        self.tableView.isHidden = true
        let alert = UIAlertController(title: "Error", message: "Something went wrong", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        DispatchQueue.main.async {
            self.title = "Error"
            self.view.backgroundColor = .white
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func setTitle(with title: String) {
        self.title = title
    }
    
    func navBarButtons() {        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "info"))
    }
}

extension AchievementsView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return achievements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as! CustomTableViewCell
        cell.setValues(achieve: achievements[indexPath.row])
        
        if (!achievements[indexPath.row].accessible) {
            cell.isUserInteractionEnabled = false
            cell.disableFields(achieve: achievements[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
}
