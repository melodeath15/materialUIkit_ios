//
//  FieldStyle2.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/24/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol FieldStyle2Delegate {
    func textChange(text: String, tag: NSInteger)
    func login()
}

class FieldStyle2: UITableViewCell, UITextFieldDelegate {

    var delegate: FieldStyle2Delegate?
    
    @IBOutlet var changeLogo: UIImageView!
    @IBOutlet var fullname: UITextField!
    @IBOutlet var username: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var confirmPassword: UITextField!
    @IBOutlet var viewBg: UIView!
    @IBOutlet var changeButtonDown: UIButton!
    
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
        
        viewBg.layer.cornerRadius = 4
        viewBg.clipsToBounds = true
        
        changeLogo.layer.cornerRadius = changeLogo.frame.size.width/2
        changeLogo.clipsToBounds = true
        
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.textChange(text: textField.text!, tag: textField.tag)
    }
    
    @IBAction func pushLogin(_ sender: Any) {
        delegate?.login()
    }
    
}
