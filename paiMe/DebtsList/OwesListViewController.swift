//
//  OwesListViewController.swift
//  paiMe
//
//  Created by Miguel Coleto Muñoz on 6/11/17.
//  Copyright © 2017 Miguel Coleto Muñoz. All rights reserved.
//

import UIKit

class OwesListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var presenter: DebtsListPresentation?
    var debts: [Debt] = [Debt]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewDidLoad()
    }
    @IBAction func onSaveButtonPressed(_ sender: UIBarButtonItem) {
        presenter?.showNewDebtModal()
    }
}

extension OwesListViewController: DebtsListView {
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
    
    func removeItem(_ item: Debt) {
        debts = debts.filter { $0 != item }
        self.tableView.reloadData()
    }
    
    func updateItem(_ item: Debt) {
        debts = debts.map {
            if ($0.id == item.id) {
                return item
            } else {
                return $0
            }
        }
        self.tableView.reloadData()
    }
}

extension OwesListViewController : UITableViewDataSource, UITableViewDelegate {    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return debts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OweCell", for: indexPath)
        cell.textLabel?.text = debts[indexPath.row].to
        cell.detailTextLabel?.text = String(debts[indexPath.row].quantity) + " €"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presenter?.onRemoveDebt(at: indexPath.row, debt: debts[indexPath.row])
        }
    }
}
