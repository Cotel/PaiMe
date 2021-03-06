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
        let debt = Debt(id: 0, from: from, to: to, quantity: quantity, payed: false)
        let result = dao.addDebt(debt)
        presenter?.onDebtCreated(result)
    }
    
}
