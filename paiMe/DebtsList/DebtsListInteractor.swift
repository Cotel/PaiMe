//
//  GetDebts.swift
//  paiMe
//
//  Created by Miguel Coleto Muñoz on 3/11/17.
//  Copyright © 2017 Miguel Coleto Muñoz. All rights reserved.
//

import Foundation

class DebtsListInteractor: DebtsListInteractorInput {
    var presenter: DebtsListInteractorOutput?
    let dao: DebtsDAO
    
    init(dao: DebtsDAO) {
        self.dao = dao
    }
    
    func retrieveDebts() {
        let debts = dao.getAllDebts().filter { $0.to == "Me" }
        presenter?.didRetrieveDebts(debts)
    }
    
    func removeDebt(_ debt: Debt) {
        dao.removeDebt(debt)
        presenter?.didRemoveDebt(debt)
    }
    
    
}
