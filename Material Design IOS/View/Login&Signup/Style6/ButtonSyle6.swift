//
//  ButtonSyle6.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/25/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ButtonSyle6Delegate {
    func SignUp()
    func SignIn()
}

class ButtonSyle6: UIView {
    
    var delegate: ButtonSyle6Delegate?
    
    @IBOutlet var imgHeader: UIImageView!
    @IBOutlet var changeIcon: UIImageView!
    @IBOutlet var btnSignUp: UIButton!
    @IBOutlet var btnSignIn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        changeIcon.layer.cornerRadius = changeIcon.frame.size.width/2
        changeIcon.clipsToBounds = true
    }
    
    @IBAction func pushSignUp(_ sender: Any) {
        btnSignIn.setTitleColor(UIColor.lightGray, for: .normal)
        btnSignUp.setTitleColor(UIColor.white, for: .normal)
        delegate?.SignUp()
    }
    
    @IBAction func pushSignIn(_ sender: Any) {
        btnSignIn.setTitleColor(UIColor.white, for: .normal)
        btnSignUp.setTitleColor(UIColor.lightGray, for: .normal)
        delegate?.SignIn()
    }
    
    
}
