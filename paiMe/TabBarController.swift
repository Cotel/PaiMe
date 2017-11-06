//
//  TabBarWireframe.swift
//  paiMe
//
//  Created by Miguel Coleto Muñoz on 6/11/17.
//  Copyright © 2017 Miguel Coleto Muñoz. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        let debtsList = DebtsListWireframe.createDebtsListModule()
        let owesList = DebtsListWireframe.createOwesListModule()
        
        debtsList.tabBarItem = UITabBarItem(title: "People who owe me", image: UIImage(named: "Debts"), tag: 0)
        owesList.tabBarItem = UITabBarItem(title: "People I Owe", image: UIImage(named: "Owes"), tag: 1)
    
        let vcList = [debtsList, owesList]
        viewControllers = vcList
    }
    
}
