//
//  FieldStyle13.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/30/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol FieldStyle13Delegate {
    func textChange(text: String, tag: NSInteger)
    func cekBoxStatus(status: M13Checkbox)
    func forgotPassword()
}

class FieldStyle13: UIView, UITextFieldDelegate {
    
    var delegate: FieldStyle13Delegate?
    @IBOutlet var cekBox: M13Checkbox!
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var btnforgotPassword: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        username.delegate = self
        password.delegate = self
        username.tag = 0
        password.tag = 1
        
        username.layer.borderWidth = 1
        username.layer.borderColor = UIColor.white.cgColor
        username.clipsToBounds = true
        
        password.layer.borderWidth = 1
        password.layer.borderColor = UIColor.white.cgColor
        password.clipsToBounds = true
        
        cekBox.boxType = M13Checkbox.BoxType(rawValue: "Square")!
        
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
}
