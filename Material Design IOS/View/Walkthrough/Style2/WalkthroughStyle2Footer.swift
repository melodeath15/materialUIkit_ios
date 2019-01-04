//
//  WalkthroughStyle2Footer.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/4/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol WalkthroughStyle2FooterDelegate {
    func signUp()
    func signIn()
}

class WalkthroughStyle2Footer: UIView {

    var delegate : WalkthroughStyle2FooterDelegate?
    @IBOutlet var btnSignIn: UIButton!
    @IBOutlet var btnSignUp: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let myColor : UIColor = UIColor.lightGray
        btnSignUp.layer.borderColor = myColor.cgColor
        btnSignUp.layer.borderWidth = 0.5
        btnSignUp.clipsToBounds = true
    }
    
    @IBAction func pushSignIn(_ sender: Any) {
        delegate?.signIn()
    }
    
    @IBAction func pushSignUp(_ sender: Any) {
        delegate?.signUp()
    }
}
