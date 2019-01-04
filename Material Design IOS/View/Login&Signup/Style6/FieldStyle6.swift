//
//  FieldStyle6.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/25/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol FieldStyle6Delegate {
    func textChange(text: String, tag: NSInteger)
    func CreateAccount()
    func Term()
}

class FieldStyle6: UITableViewCell, UITextFieldDelegate {
    
    var delegate: FieldStyle6Delegate?

    @IBOutlet var fullname: UITextField!
    @IBOutlet var username: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var confirmPassword: UITextField!
    
    @IBOutlet var changeButton1: UIButton!
    @IBOutlet var changeLabel: UILabel!
    @IBOutlet var changeButtonTerm: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
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

    
    @IBAction func pushAccount(_ sender: Any) {
        delegate?.CreateAccount()
    }
    
    @IBAction func btnTerm(_ sender: Any) {
        delegate?.Term()
    }
}
