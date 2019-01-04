//
//  ButtonStyle1.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/23/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ButtonStyle1Delegate {
    func CreateAccount()
    func Signin()
}

class ButtonStyle1: UITableViewCell {
    
    var delegate: ButtonStyle1Delegate?
    
    @IBOutlet var changeButtonUp: UIButton!
    @IBOutlet var changeDown: UIButton!
    
    @IBAction func pushCreate(_ sender: Any) {
        delegate?.CreateAccount()
    }
    
    @IBAction func pushSIgnin(_ sender: Any) {
        delegate?.Signin()
    }
}
