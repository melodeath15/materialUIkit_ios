//
//  ViewFooterStyle22.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/1/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ViewFooterStyle22Delegate {
    func SignUp()
    func SignIn()
}

class ViewFooterStyle22: UIView {
    
    var delegate: ViewFooterStyle22Delegate?
    @IBOutlet var btnSignup: UIButton!
    @IBOutlet var btnSignin: UIButton!
    
    @IBAction func pushSignUp(_ sender: Any) {
        delegate?.SignUp()
    }
    
    @IBAction func pushSignIn(_ sender: Any) {
        delegate?.SignIn()
    }
    
}
