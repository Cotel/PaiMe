//
//  DebtsListWireframe.swift
//  paiMe
//
//  Created by Miguel Coleto Muñoz on 3/11/17.
//  Copyright © 2017 Miguel Coleto Muñoz. All rights reserved.
//

import Foundation
import UIKit

class DebtsListWireframe : DebtsListWireframeProtocol {
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    class func createDebtsListModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "DebtsListNavigationController")
        if let view = navController.childViewControllers.first as? DebtsListView {
            let presenter = DebtsListPresenter()
            let dao = DebtsDAO()
            let interactor = DebtsListInteractor(dao: dao)
            let wireframe = DebtsListWireframe()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireframe = wireframe
            presenter.interactor = interactor
            interactor.presenter = presenter
            
            return navController
        }
        return UIViewController()
    }
    
    class func createOwesListModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "OwesListNavigationController")
        if let view = navController.childViewControllers.first as? DebtsListView {
            let presenter = DebtsListPresenter()
            let dao = DebtsDAO()
            let interactor = OwesListInteractor(dao: dao)
            let wireframe = DebtsListWireframe()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireframe = wireframe
            presenter.interactor = interactor
            interactor.presenter = presenter
            
            return navController
        }
        return UIViewController()
    }
    
    func presentNewDebtScreen(from view: DebtsListView) {
        let newDebtViewController = NewDebtWireframe.createNewDebtModule(modalDelegate: view.presenter as! NewDebtModalDelegate)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.present(newDebtViewController, animated: true, completion: nil)
        }
    }
}
