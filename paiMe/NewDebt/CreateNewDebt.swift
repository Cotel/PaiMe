//
//  CreateNewDebt.swift
//  paiMe
//
//  Created by Miguel Coleto Muñoz on 3/11/17.
//  Copyright © 2017 Miguel Coleto Muñoz. All rights reserved.
//

import Foundation

class CreateNewDebt {
    let dao: DebtsDAO
    
    init(dao: DebtsDAO) {
        self.dao = dao
    }
    
    func execute(_ debt: Debt) -> [Debt] {
        dao.addDebt(debt: debt)
        return dao.getAllDebts()
    }
}
