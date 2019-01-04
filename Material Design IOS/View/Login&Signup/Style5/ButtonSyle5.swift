//
//  ButtonSyle5.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/25/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ButtonSyle5Delegate {
    func SignIn()
    func SingUp()
}

class ButtonSyle5: UITableViewCell {
    
    var delegate: ButtonSyle5Delegate?
    
    @IBOutlet var btnSignUp: UIButton!
    @IBOutlet var btnSIgnIn: UIButton!
    
    @IBAction func pushSignUp(_ sender: Any) {
        delegate?.SingUp()
    }
    
    @IBAction func pushSignIn(_ sender: Any) {
        delegate?.SignIn()
    }
    
}
