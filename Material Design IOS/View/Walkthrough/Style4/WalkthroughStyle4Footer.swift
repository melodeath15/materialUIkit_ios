//
//  WalkthroughStyle4Footer.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/4/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol WalkthroughStyle4FooterDelegate {
    func signUp()
    func SignIn()
}

class WalkthroughStyle4Footer: UIView {
    
    var delegate: WalkthroughStyle4FooterDelegate?
    @IBOutlet var btnSignUp: UIButton!
    @IBOutlet var btnSignIn: UIButton!
    
    @IBAction func pushSignUp(_ sender: Any) {
        delegate?.signUp()
    }
    
    @IBAction func pushSignIn(_ sender: Any) {
        delegate?.SignIn()
    }
}
