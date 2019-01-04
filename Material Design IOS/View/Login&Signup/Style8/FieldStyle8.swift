//
//  FieldStyle8.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/29/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol FieldStyle8Delegate {
    func textChange(text: String, tag: NSInteger)
    func CreateAccount()
    func Signin()
}

class FieldStyle8: UITableViewCell, UITextFieldDelegate {
    
    var delegate: FieldStyle8Delegate?
    @IBOutlet var viewBg: UIView!
    @IBOutlet var username: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var confirmPassword: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        username.delegate = self
        email.delegate = self
        password.delegate = self
        confirmPassword.delegate = self
        
        username.tag = 0
        email.tag = 1
        password.tag = 2
        confirmPassword.tag = 3
        
        viewBg.layer.cornerRadius = 4
        viewBg.clipsToBounds = true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.textChange(text: textField.text!, tag: textField.tag)
    }
    
    
    @IBAction func pushAccount(_ sender: Any) {
        delegate?.CreateAccount()
    }
    
    @IBAction func pushSign(_ sender: Any) {
        delegate?.Signin()
    }
}
