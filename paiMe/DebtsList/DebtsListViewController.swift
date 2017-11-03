//
//  ViewController.swift
//  paiMe
//
//  Created by Miguel Coleto Muñoz on 2/11/17.
//  Copyright © 2017 Miguel Coleto Muñoz. All rights reserved.
//

import UIKit

class DebtsListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var presenter: DebtsListPresentation?
    var debts: [Debt] = [Debt]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewDidLoad()
    }
}

extension DebtsListViewController : DebtsListView {
    func showError() {
        
    }
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    func showData(_ data: [Debt]) {
        debts.append(contentsOf: data)
        self.tableView.reloadData()
    }
    
    func showEmptyData() {
        
    }
}

extension DebtsListViewController : UITableViewDataSource, UITableViewDelegate {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return debts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DebtCell", for: indexPath)
        cell.textLabel?.text = debts[indexPath.row].from
        cell.detailTextLabel?.text = String(debts[indexPath.row].quantity) + " €"
        return cell
    }
}

