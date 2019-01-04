//
//  WalkthroughStyle8Footer.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol WalkthroughStyle8FooterDelegate {
    func facebook()
    func signUp()
    func SignIn()
}

class WalkthroughStyle8Footer: UIView {
    
    var delegate: WalkthroughStyle8FooterDelegate?
    @IBOutlet var btnSignUp: UIButton!
    @IBOutlet var btnSignIn: UIButton!
    @IBOutlet var btnFB: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let myColor : UIColor = UIColor.lightGray
        btnSignUp.layer.borderColor = myColor.cgColor
        btnSignUp.layer.borderWidth = 0.5
        btnSignUp.clipsToBounds = true
        
        btnSignIn.layer.borderColor = myColor.cgColor
        btnSignIn.layer.borderWidth = 0.5
        btnSignIn.clipsToBounds = true
        
    }
    
    @IBAction func pushSignUp(_ sender: Any) {
        delegate?.signUp()
    }
    
    @IBAction func pushSignIn(_ sender: Any) {
        delegate?.SignIn()
    }
    
    @IBAction func pushBtnFB(_ sender: Any) {
        delegate?.facebook()
    }
    
}
