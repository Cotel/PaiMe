//
//  NewDebtPresenter.swift
//  paiMe
//
//  Created by Miguel Coleto Muñoz on 3/11/17.
//  Copyright © 2017 Miguel Coleto Muñoz. All rights reserved.
//

import Foundation

class NewDebtPresenter: NewDebtPresentation {
    var delegate: NewDebtModalDelegate?
    var interactor: NewDebtInteractorInput?
    var wireframe: NewDebtWireframe?
    var view: NewDebtView?
    
    func onViewDidLoad() {
        view?.disableSaveButton()
    }
    
    func updateSaveButton(from: String, to: String, quantity: String) {
        if (from.isEmpty || to.isEmpty || quantity.isEmpty) {
            view?.disableSaveButton()
        } else {
            view?.enableSaveButton()
        }
    }
    
    func createNewDebt(from: String, to: String, quantity: Double) {
        interactor?.createNewDebt(from: from, to: to, quantity: quantity)
    }
    
    func dismiss() {
        wireframe?.dismiss(view!)
    }
}

extension NewDebtPresenter: NewDebtInteractorOutput {
    func onDebtCreated(_ debt: Debt) {
        delegate?.sendValue(debt)
        view?.dismissModal()
    }
    
    func onError() {
        
    }
    
}
