//
//  NewDebtInteractor.swift
//  paiMe
//
//  Created by Miguel Coleto Muñoz on 3/11/17.
//  Copyright © 2017 Miguel Coleto Muñoz. All rights reserved.
//

import Foundation

class NewDebtInteractor: NewDebtInteractorInput {
    var presenter: NewDebtInteractorOutput?
    let dao: DebtsDAO
    
    init(dao: DebtsDAO) {
        self.dao = dao
    }
    
    func createNewDebt(from: String, to: String, quantity: Double) {
        let debt = Debt(from: from, to: to, quantity: quantity)
        dao.addDebt(debt: debt)
        presenter?.onDebtCreated(debt)
    }
    
}
