//
//  EcommerceStyle24Cost.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/10/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceStyle24Cost: UITableViewCell, AKRadioButtonsControllerDelegate {
    
    var radioButtonsController: AKRadioButtonsController!
    @IBOutlet var arrayRadioButtons : [AKRadioButton]!
    @IBOutlet var cek1: AKRadioButton!
    @IBOutlet var cek2: AKRadioButton!
    @IBOutlet var cek3: AKRadioButton!

    @IBOutlet var price1: UILabel!
    @IBOutlet var price2: UILabel!
    @IBOutlet var price3: UILabel!
        
    @IBOutlet var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.radioButtonsController = AKRadioButtonsController(radioButtons: self.arrayRadioButtons)
        self.radioButtonsController.delegate = self
        
    }
    
    func selectedButton(sender: AKRadioButton) {
        print("\(sender.title(for: .normal)!)")
    }
}
