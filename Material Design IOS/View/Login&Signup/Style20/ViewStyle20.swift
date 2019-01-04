//
//  ViewStyle20.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/1/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ViewStyle20Delegate {
    func textChange(text: String, tag: NSInteger)
    func cekBoxStatus(status: M13Checkbox)
    func forgotPassword()
    func signIn()
    func loginFb()
}

class ViewStyle20: UIView, UITextFieldDelegate{
    
    var delegate: ViewStyle20Delegate?
    @IBOutlet var title: UILabel!
    @IBOutlet var logo: UIImageView!
    @IBOutlet var viewBg: UIView!
    @IBOutlet var cekBox: M13Checkbox!
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var btnforgotPassword: UIButton!
    @IBOutlet var btnSignIn: UIButton!
    @IBOutlet var btnFacebook: UIButton!
    
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
    
}
