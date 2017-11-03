//
//  AppDelegate.swift
//  paiMe
//
//  Created by Miguel Coleto Muñoz on 2/11/17.
//  Copyright © 2017 Miguel Coleto Muñoz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let debtsList = DebtsListWireframe.createDebtsListModule()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = debtsList
        window?.makeKeyAndVisible()
        
        return true
    }


}

