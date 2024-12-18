//
//  HomeViewController.swift
//  cttest
//
//  Created by Kosmas Ndruru on 13/03/24.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()
    
    private let button: UIButton = {
       let button = UIButton()
       button.backgroundColor = .systemBlue
       button.setTitle("View Product", for: .normal)
       button.layer.cornerRadius = 7
       return button
   }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        homeFeedTable.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        self.setUpUI()
        self.button.addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
   
   private func setUpUI(){
       self.view.addSubview(button)
       self.button.translatesAutoresizingMaskIntoConstraints = false
       NSLayoutConstraint.activate([
           button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
           button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
           button.widthAnchor.constraint(equalToConstant: 200),
           button.heightAnchor.constraint(equalToConstant: 44)
       ])
   }
   
   @objc func onButtonTapped(){
//       recordOnUserLogin()
//       recordUserEventWithProperties()
   }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
