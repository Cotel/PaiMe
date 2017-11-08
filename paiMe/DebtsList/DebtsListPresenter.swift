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
    
    func onViewDidLoad() {
        view?.showLoading()
        interactor?.retrieveDebts()
    }
    
    func showNewDebtModal() {
        wireframe?.presentNewDebtScreen(from: view!)
    }
    
    func onRemoveDebt(at: Int, debt: Debt) {
        interactor?.removeDebt(debt)
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
    
    func didRemoveDebt(_ debt: Debt) {
        view?.removeItem(debt)
    }
    
    
}

extension DebtsListPresenter: NewDebtModalDelegate {
    func sendValue(_ debt: Debt) {
        view?.showData([debt])
    }
}
