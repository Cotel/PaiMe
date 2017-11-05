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
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    class func createNewDebtModule(modalDelegate: NewDebtModalDelegate) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "NewDebtViewController")
        if var view = viewController as? NewDebtView {
            let presenter = NewDebtPresenter()
            let dao = DebtsDAO()
            let interactor = NewDebtInteractor(dao: dao)
            let wireframe = NewDebtWireframe()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireframe = wireframe
            presenter.interactor = interactor
            presenter.delegate = modalDelegate
            interactor.presenter = presenter
            
            return viewController
        }
        
        return UIViewController()
    }
    
    func dismiss(_ view: NewDebtView) {
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.popViewController(animated: true)
        }
    }
    
}
