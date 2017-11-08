//
//  DebtsListContract.swift
//  paiMe
//
//  Created by Miguel Coleto Muñoz on 3/11/17.
//  Copyright © 2017 Miguel Coleto Muñoz. All rights reserved.
//

import Foundation
import UIKit

protocol DebtsListView: class {
    var presenter: DebtsListPresentation? {get set}
    
    func showData(_ data: [Debt])
    func showEmptyData()
    func updateItem(_ item: Debt)
    func removeItem(_ item: Debt)
    func showError()
    func showLoading()
    func hideLoading()
}

protocol DebtsListPresentation {
    var view: DebtsListView? {get set}
    var interactor: DebtsListInteractorInput? {get set}
    var wireframe: DebtsListWireframe? {get set}
    
    func onViewDidLoad()
    func showNewDebtModal()
    func onRemoveDebt(at: Int, debt: Debt)
    func onTogglePayedStateForDebt(_ debt: Debt)
}

protocol DebtsListWireframeProtocol {
    static func createDebtsListModule() -> UIViewController
    static func createOwesListModule() -> UIViewController
    
    func presentNewDebtScreen(from view: DebtsListView)
}

protocol DebtsListInteractorOutput {
    func didRetrieveDebts(_ debts: [Debt])
    func didRemoveDebt(_ debt: Debt)
    func didTogglePayedStateForDebt(_ debt: Debt)
    func onError()
}

protocol DebtsListInteractorInput {
    var presenter: DebtsListInteractorOutput? {get set}
    func retrieveDebts()
    func removeDebt(_ debt: Debt)
    func togglePayedState(_ debt: Debt)
}
