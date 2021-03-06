//
//  FieldStyle18.swift
//  Material Design IOS
//
//  Created by Denis Titra Prada on 5/31/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol FieldStyle18Delegate {
    func textChange(text: String, tag: NSInteger)
    func cekBoxStatus(status: M13Checkbox)
    func forgotPassword()
    func signIn()
    func signUp()
    func loginFb()
}

class FieldStyle18: UITableViewCell, UITextFieldDelegate {
    
    var delegate: FieldStyle18Delegate?
    @IBOutlet var viewBg: UIView!
    @IBOutlet var cekBox: M13Checkbox!
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var btnforgotPassword: UIButton!
    @IBOutlet var btnSignIn: UIButton!
    @IBOutlet var btnFacebook: UIButton!
    @IBOutlet var btnSignUp: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        username.delegate = self
        password.delegate = self
        username.tag = 0
        password.tag = 1
        
        cekBox.boxType = M13Checkbox.BoxType(rawValue: "Square")!
        
        viewBg.layer.cornerRadius = 4
        viewBg.clipsToBounds = true
        
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.textChange(text: textField.text!, tag: textField.tag)
    }
    
    @IBAction func pushCekBox(_ sender: Any) {
        delegate?.cekBoxStatus(status: cekBox)
    }
    
    
    @IBAction func pushForgot(_ sender: Any) {
        delegate?.forgotPassword()
    }
    
    @IBAction func pushSignIn(_ sender: Any) {
        delegate?.signIn()
    }
    
    @IBAction func pushFacebook(_ sender: Any) {
        delegate?.loginFb()
    }
    
    @IBAction func pushSignUp(_ sender: Any) {
        delegate?.signUp()
    }
}
