//
//  FieldStyle1.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/23/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol FieldStyle1Delegate {
    func textChange(text: String, tag: NSInteger)
}

class FieldStyle1: UITableViewCell, UITextFieldDelegate {
    
    var delegate: FieldStyle1Delegate?
    @IBOutlet var fullname: UITextField!
    @IBOutlet var username: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var confirmPassword: UITextField!
    
    override func awakeFromNib() {
        
        fullname.delegate = self
        username.delegate = self
        email.delegate = self
        password.delegate = self
        confirmPassword.delegate = self
        
        fullname.tag = 0
        username.tag = 1
        email.tag = 2
        password.tag = 3
        confirmPassword.tag = 4
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.textChange(text: textField.text!, tag: textField.tag)
    }
    
}
