//
//  DebtsDAO.swift
//  paiMe
//
//  Created by Miguel Coleto Muñoz on 3/11/17.
//  Copyright © 2017 Miguel Coleto Muñoz. All rights reserved.
//

import Foundation

class DebtsDAO {
    fileprivate var database: [Debt] = [
        Debt(from: "Me", to: "Juan", quantity: 1.1),
        Debt(from: "Juan", to: "Me", quantity: 12),
        Debt(from: "Pedro", to: "Me", quantity: 62.37),
    ]
    
    func getAllDebts() -> [Debt] {
        return database
    }
    
    func addDebt(_ debt: Debt) {
        database.append(debt)
    }
    
    func removeDebt(_ debt: Debt) {
        database = database.filter { $0 != debt }
    }
}
