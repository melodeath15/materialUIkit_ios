//
//  ButtonStyle3.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/24/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ButtonStyle3Delegate {
    func CreateAccount()
}

class ButtonStyle3: UIView {
    
    var delegate: ButtonStyle3Delegate?
    @IBOutlet var changeButton: UIButton!
    
    @IBAction func pushCreatAccount(_ sender: Any) {
        delegate?.CreateAccount()
    }
}
