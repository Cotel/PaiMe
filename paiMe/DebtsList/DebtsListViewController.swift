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
    
    @IBAction func onAddButtonPressed(_ sender: UIBarButtonItem) {
        presenter?.showNewDebtModal()
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

extension DebtsListViewController : DebtTableCellDelegate {
    func didPressToggleButton(_ tag: Int) {
        print(tag)
        let debt = debts[tag]
        presenter?.onTogglePayedStateForDebt(debt)
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
        let identifier = "DebtTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? DebtTableViewCell else {
            fatalError("Dequeued cell is not of type DebtTableViewCell")
        }
        let debt = debts[indexPath.row]
        
        cell.personNameLabel.text = debt.from
        cell.quantityLabel.text = String(debt.quantity) + " €"
        cell.tag = indexPath.row
        if (!debt.payed) {
            cell.togglePayedButton.setTitle("Mark as Payed", for: .normal)
        } else {
          cell.togglePayedButton.setTitle("Mark as Unpayed", for: .normal)
        }
        cell.cellDelegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presenter?.onRemoveDebt(at: indexPath.row, debt: debts[indexPath.row])
        }
    }
}

