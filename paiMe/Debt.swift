//
//  Debt.swift
//  paiMe
//
//  Created by Miguel Coleto Muñoz on 2/11/17.
//  Copyright © 2017 Miguel Coleto Muñoz. All rights reserved.
//

import Foundation

struct Debt : Equatable {
    var id: Int
    var from: String
    var to: String
    var quantity: Double
    var payed: Bool
}

func ==(lhs: Debt, rhs: Debt) -> Bool {
    return lhs.from == rhs.from &&
        lhs.to == rhs.to &&
        lhs.quantity == rhs.quantity &&
        lhs.payed == rhs.payed
}

