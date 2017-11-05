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
