//
//  NewDebtContract.swift
//  paiMe
//
//  Created by Miguel Coleto Muñoz on 3/11/17.
//  Copyright © 2017 Miguel Coleto Muñoz. All rights reserved.
//

import Foundation
import UIKit

protocol NewDebtView {
    var presenter: NewDebtPresentation? {get set}
    
    func showError()
    func dismissModal()
}

protocol NewDebtPresentation {
    var view: NewDebtView? {get set}
    var interactor: NewDebtInteractorInput? {get set}
    var wireframe: NewDebtWireframe? {get set}
    var modalDelegate: NewDebtModalDelegate? {get set}
    
    func onViewDidLoad()
    func createNewDebt(from: String, to: String, quantity: Double)
}

protocol NewDebtInteractorOutput {
    func onDebtCreated(_ debt: Debt)
    func onError()
}

protocol NewDebtModalDelegate {
    func addDebtDidSave()
    func addDebtDidCancel()
}

protocol NewDebtInteractorInput {
    var presenter: NewDebtInteractorOutput? {get set}
    func createNewDebt(from: String, to: String, quantity: Double)
}

protocol NewDebtWireframeProtocol {
    var view: NewDebtView? {get set}
    
    static func createNewDebtModule(modalDelegate: NewDebtModalDelegate) -> UIViewController
    func dismissModal()
}
