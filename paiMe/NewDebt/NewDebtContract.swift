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
    var delegate: NewDebtModalDelegate? {get set}
    
    func onViewDidLoad()
    func createNewDebt(from: String, to: String, quantity: Double)
    func dismiss()
}

protocol NewDebtInteractorOutput {
    func onDebtCreated(_ debt: Debt)
    func onError()
}

protocol NewDebtModalDelegate {
    func sendValue(_ debt: Debt)
}

protocol NewDebtInteractorInput {
    var presenter: NewDebtInteractorOutput? {get set}
    func createNewDebt(from: String, to: String, quantity: Double)
}

protocol NewDebtWireframeProtocol {    
    static func createNewDebtModule(modalDelegate: NewDebtModalDelegate) -> UIViewController
    func dismiss(_ view: NewDebtView)
}
