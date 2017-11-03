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
    func showError()
    func showLoading()
    func hideLoading()
}

protocol DebtsListPresentation {
    var view: DebtsListView? {get set}
    var interactor: DebtsListInteractorInput? {get set}
    var wireframe: DebtsListWireframe? {get set}
    
    func onViewDidLoad()
}

protocol DebtsListWireframeProtocol {
    static func createDebtsListModule() -> UIViewController
    
    func presentNewDebtScreen(from view: DebtsListView)
}

protocol DebtsListInteractorOutput {
    func didRetrieveDebts(_ debts: [Debt])
    func onError()
}

protocol DebtsListInteractorInput {
    var presenter: DebtsListInteractorOutput? {get set}
    func retrieveDebts()
}
