//
//  DebtTableViewCell.swift
//  paiMe
//
//  Created by Miguel Coleto Muñoz on 8/11/17.
//  Copyright © 2017 Miguel Coleto Muñoz. All rights reserved.
//

import UIKit

class DebtTableViewCell: UITableViewCell {
    
    weak var cellDelegate: DebtTableCellDelegate?
    
    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var togglePayedButton: UIButton!
    
    @IBAction func toggleButtonAction(_ sender: UIButton) {
        cellDelegate?.didPressToggleButton(sender.tag)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

protocol DebtTableCellDelegate : class {
    func didPressToggleButton(_ tag: Int)
}
