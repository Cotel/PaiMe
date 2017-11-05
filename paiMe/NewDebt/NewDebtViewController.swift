//
//  NewDebtViewController.swift
//  paiMe
//
//  Created by Miguel Coleto Muñoz on 2/11/17.
//  Copyright © 2017 Miguel Coleto Muñoz. All rights reserved.
//

import UIKit

class NewDebtViewController: UIViewController {

    var presenter: NewDebtPresentation?
    
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var toTextField: UITextField!
    @IBOutlet weak var quantityNumberField: UITextField!
    
    @IBAction func onCancelButtonPressed(_ sender: UIBarButtonItem) {
        dismissModal()
    }
    @IBAction func onSaveButtonPressed(_ sender: UIBarButtonItem) {
        let from: String = (fromTextField.text)!
        let to: String = (toTextField.text)!
        let quantity: Double = Double(quantityNumberField.text!)!
        
        presenter?.createNewDebt(from: from, to: to, quantity: quantity)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewDidLoad()
    }
    


}

extension NewDebtViewController: NewDebtView {
    func showError() {
        
    }
    
    func dismissModal() {
        presenter?.dismiss()
    }
    
}



