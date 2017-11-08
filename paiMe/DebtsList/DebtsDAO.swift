//
//  DebtsDAO.swift
//  paiMe
//
//  Created by Miguel Coleto Muñoz on 3/11/17.
//  Copyright © 2017 Miguel Coleto Muñoz. All rights reserved.
//

import Foundation

class DebtsDAO {
    fileprivate var database: [Debt] = []
    
    func getAllDebts() -> [Debt] {
        return database
    }
    
    func addDebt(_ debt: Debt) -> Debt {
        let debtWithId = Debt(
            id: database.count+1,
            from: debt.from,
            to: debt.to,
            quantity: debt.quantity,
            payed: debt.payed)
        database.append(debtWithId)
        return debtWithId
    }
    
    func updateDebt(_ debt: Debt) -> Debt {
        database = database.map { savedDebt in
            if (savedDebt.id == debt.id) {
                return debt
            } else {
                return savedDebt
            }
        }
        return debt
    }
    
    func removeDebt(_ debt: Debt) {
        database = database.filter { $0.id != debt.id }
    }
}
