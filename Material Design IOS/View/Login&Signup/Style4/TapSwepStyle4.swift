//
//  TapSwepStyle4.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/25/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol TapSwepStyle4Delegate {
    func SignUp()
    func SignIn()
}

class TapSwepStyle4: UIView {
   
    var delegate : TapSwepStyle4Delegate?
    
    @IBOutlet var btnSignUp: UIButton!
    @IBOutlet var btnSIgnIn: UIButton!
    @IBOutlet var viewButton: UIView!
    @IBOutlet var viewButton2: UIView!
    
    @IBAction func pushSignUp(_ sender: Any) {
        btnSignUp.setTitleColor(UIColor.white, for: .normal)
        btnSIgnIn.setTitleColor(UIColor.lightText, for: .normal)
        viewButton.isHidden = false
        viewButton2.isHidden = true
        delegate?.SignUp()
    }
    
    @IBAction func pushSignIn(_ sender: Any) {
        btnSignUp.setTitleColor(UIColor.lightText, for: .normal)
        btnSIgnIn.setTitleColor(UIColor.white, for: .normal)
        viewButton.isHidden = true
        viewButton2.isHidden = false
        delegate?.SignIn()
    }
    
    
}
