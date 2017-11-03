//
//  NewDebtWireframe.swift
//  paiMe
//
//  Created by Miguel Coleto Muñoz on 3/11/17.
//  Copyright © 2017 Miguel Coleto Muñoz. All rights reserved.
//

import Foundation
import UIKit

class NewDebtWireframe : NewDebtWireframeProtocol {    
    var view: NewDebtView?
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    class func createNewDebtModule(modalDelegate: NewDebtModalDelegate) -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "NewDebtNavigationController")
        if var view = navController.childViewControllers.first as? NewDebtView {
            let presenter = NewDebtPresenter()
            let dao = DebtsDAO()
            let interactor = NewDebtInteractor(dao: dao)
            let wireframe = NewDebtWireframe()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireframe = wireframe
            wireframe.view = view
            presenter.interactor = interactor
            presenter.modalDelegate = modalDelegate
            interactor.presenter = presenter
            
            return navController
        }
        
        return UIViewController()
    }
    
    func dismissModal() {
        view?.dismissModal()
    }
    
}
