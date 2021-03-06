//
//  OwesListInteractor.swift
//  paiMe
//
//  Created by Miguel Coleto Muñoz on 6/11/17.
//  Copyright © 2017 Miguel Coleto Muñoz. All rights reserved.
//

import Foundation

class OwesListInteractor: DebtsListInteractorInput {
    var presenter: DebtsListInteractorOutput?
    let dao: DebtsDAO
    
    init(dao: DebtsDAO) {
        self.dao = dao
    }
    
    func retrieveDebts() {
        let owes = dao.getAllDebts().filter { $0.from == "Me" }
        presenter?.didRetrieveDebts(owes)
    }
    
    func removeDebt(_ debt: Debt) {
        dao.removeDebt(debt)
        presenter?.didRemoveDebt(debt)
    }
    
    func togglePayedState(_ debt: Debt) {
        let newStateDebt = Debt(
            id: debt.id,
            from: debt.from,
            to: debt.to,
            quantity: debt.quantity,
            payed: !debt.payed
        )
        dao.updateDebt(newStateDebt)
        presenter?.didTogglePayedStateForDebt(newStateDebt)
    }
}
