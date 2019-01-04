//
//  EcommerceStyle25Payment.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/10/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceStyle25Payment: UITableViewCell, AKRadioButtonsControllerDelegate {
    
    var radioButtonsController: AKRadioButtonsController!
    @IBOutlet var arrayRadioButtons : [AKRadioButton]!
    @IBOutlet var cek1: AKRadioButton!
    @IBOutlet var cek2: AKRadioButton!
    @IBOutlet var cek3: AKRadioButton!
    
    @IBOutlet var next1: UIImageView!
    @IBOutlet var next2: UIImageView!
    @IBOutlet var next3: UIImageView!
    
    @IBOutlet var title1: UILabel!
    @IBOutlet var title2: UILabel!
    @IBOutlet var title3: UILabel!
    @IBOutlet var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.radioButtonsController = AKRadioButtonsController(radioButtons: self.arrayRadioButtons)
        self.radioButtonsController.delegate = self
        
    }
    
    func selectedButton(sender: AKRadioButton) {
        print("\(radioButtonsController.selectedIndex)")
        
    }

    
}
