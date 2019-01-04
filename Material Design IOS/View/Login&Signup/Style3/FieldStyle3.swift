//
//  FieldStyle3.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/24/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol FieldStyle3Delegate {
    func textChange(text: String, tag: NSInteger)
    func login()
}


class FieldStyle3: UITableViewCell, UITextFieldDelegate {
    
    var delegate: FieldStyle3Delegate?
    @IBOutlet var fullname: UITextField!
    @IBOutlet var username: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var confirmPassword: UITextField!
    @IBOutlet var changeButton: UIButton!

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
        
        fullname.backgroundColor = UIColor.clear
        username.backgroundColor = UIColor.clear
        email.backgroundColor = UIColor.clear
        password.backgroundColor = UIColor.clear
        confirmPassword.backgroundColor = UIColor.clear
        
        let myColor : UIColor = UIColor.white
        fullname.layer.borderColor = myColor.cgColor
        fullname.layer.borderWidth = 1.0
        username.layer.borderColor = myColor.cgColor
        username.layer.borderWidth = 1.0
        email.layer.borderColor = myColor.cgColor
        email.layer.borderWidth = 1.0
        password.layer.borderColor = myColor.cgColor
        password.layer.borderWidth = 1.0
        confirmPassword.layer.borderColor = myColor.cgColor
        confirmPassword.layer.borderWidth = 1.0
                
        fullname.clipsToBounds = true
        username.clipsToBounds = true
        email.clipsToBounds = true
        password.clipsToBounds = true
        confirmPassword.clipsToBounds = true
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.textChange(text: textField.text!, tag: textField.tag)
    }
    
    @IBAction func pushLogin(_ sender: Any) {
        delegate?.login()
    }
    
    
}
