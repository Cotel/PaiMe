//
//  NewDebtViewController.swift
//  paiMe
//
//  Created by Miguel Coleto Muñoz on 2/11/17.
//  Copyright © 2017 Miguel Coleto Muñoz. All rights reserved.
//

import UIKit

class NewDebtViewController: UIViewController, UITextFieldDelegate {

    var presenter: NewDebtPresentation?
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
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
        setUpView()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let from = fromTextField.text ?? ""
        let to = toTextField.text ?? ""
        let quantity = quantityNumberField.text ?? ""
        
        presenter?.updateSaveButton(from: from, to: to, quantity: quantity)
    }
    
    func setUpView() {
        fromTextField.delegate = self
        toTextField.delegate = self
        quantityNumberField.delegate = self
    }
}

extension NewDebtViewController: NewDebtView {
    func enableSaveButton() {
        saveButton.isEnabled = true
    }
    
    func disableSaveButton() {
        saveButton.isEnabled = false
    }
    
    func showError() {
        
    }
    
    func dismissModal() {
        presenter?.dismiss()
    }
    
}



