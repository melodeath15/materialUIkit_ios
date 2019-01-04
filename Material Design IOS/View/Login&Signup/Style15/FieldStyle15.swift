//
//  FieldStyle15.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/31/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol FieldStyle15Delegate {
    func textChange(text: String, tag: NSInteger)
    func cekBoxStatus(status: M13Checkbox)
    func forgotPassword()
    func signIn()
    func signUp()
    func signInFB()
}

class FieldStyle15: UITableViewCell, UITextFieldDelegate {
    
    var delegate: FieldStyle15Delegate?
    @IBOutlet var viewBg: UIView!
    @IBOutlet var cekBox: M13Checkbox!
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var btnforgotPassword: UIButton!
    @IBOutlet var btnSignIn: UIButton!
    @IBOutlet var btnSignUp: UIButton!
    @IBOutlet var btnFB: UIButton!
    @IBOutlet var bgOr: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        username.delegate = self
        password.delegate = self
        username.tag = 0
        password.tag = 1
        
        cekBox.boxType = M13Checkbox.BoxType(rawValue: "Square")!

        bgOr.layer.cornerRadius = bgOr.frame.size.width/2
        bgOr.layer.borderWidth = 2
        bgOr.layer.borderColor = UIColor.init(red: 242.0/255.0, green: 242.0/255.0, blue: 242.0/255.0, alpha: 1) .cgColor

        bgOr.clipsToBounds = true
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
    
    @IBAction func pushSignUp(_ sender: Any) {
        delegate?.signUp()
    }
    
    @IBAction func pushSignInFB(_ sender: Any) {
        delegate?.signInFB()
    }
  
}
