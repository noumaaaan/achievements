//
//  View.swift
//  achievements
//
//  Created by Nouman on 16/05/2021.
//

import Foundation
import UIKit

protocol AnyView {
    var presenter: AnyPresenter? { get set }
    
    func update(with achievments: [Achievement])
    func update(with error: String)
//    func setTitle(with title: String)
}

class AchievementsView: UIViewController, AnyView, UITableViewDelegate, UITableViewDataSource {
    var presenter: AnyPresenter?
    var achievements: [Achievement] = []
//    var navTitle: String = ""
    
    let tableView: UITableView = {
        let table = UITableView()
        table.isHidden = true
        return table
    }()
    
    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(tableView)
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        label.center = view.center
    }
    
    func update(with achievments: [Achievement]) {
        DispatchQueue.main.async {
            self.achievements = achievments
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async {
            self.achievements = []
            self.label.text = error
            self.tableView.isHidden = true
            self.label.isHidden = false
        }
    }
    
//    func setTitle(with title: String) {
//        self.navTitle = title
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return achievements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        cell.configure(levelString: "Level",
                         levelNum: achievements[indexPath.row].level,
                         prog: Float(achievements[indexPath.row].progress/achievements[indexPath.row].total),
                         left: String(achievements[indexPath.row].progress),
                         right: String(achievements[indexPath.row].total))
        return cell
    }
}

