//
//  DebtsListPresenter.swift
//  paiMe
//
//  Created by Miguel Coleto Muñoz on 3/11/17.
//  Copyright © 2017 Miguel Coleto Muñoz. All rights reserved.
//

import Foundation

class DebtsListPresenter: DebtsListPresentation {
    weak var view: DebtsListView?
    var interactor: DebtsListInteractorInput?
    var wireframe: DebtsListWireframe?
    
    @objc func onViewDidLoad() {
        view?.showLoading()
        interactor?.retrieveDebts()
        NotificationCenter.default.addObserver(view, selector: #selector(handleNewDebt(notification:)), name: NSNotification.Name(rawValue: "AddedNewDebt"), object: nil)

    }
    
    func showNewDebtModal() {
        wireframe?.presentNewDebtScreen(from: view!)
    }
}

extension DebtsListPresenter: DebtsListInteractorOutput {
    func didRetrieveDebts(_ debts: [Debt]) {
        view?.hideLoading()
        view?.showData(debts)
    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
    
    
}

extension DebtsListPresenter: NewDebtModalDelegate {
    func addDebtDidSave() {
        interactor?.retrieveDebts()
    }
    
    func addDebtDidCancel() {
        
    }
    
}

extension DebtsListPresenter {
        @objc func handleNewDebt(notification: NSNotification){
            if let debt = notification.userInfo?["NewDebt"] as? Debt {
                self.interactor?.handleNewDebt(debt: debt)
            }
        }
}

