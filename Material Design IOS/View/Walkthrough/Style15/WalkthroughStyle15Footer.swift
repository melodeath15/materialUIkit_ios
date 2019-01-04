//
//  WalkthroughStyle15Footer.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol WalkthroughStyle15FooterDelegate {
    func signUp()
    func signIn()
}

class WalkthroughStyle15Footer: UIView {
    
    var delegate: WalkthroughStyle15FooterDelegate?
    @IBOutlet var btnSignUp: UIButton!
    @IBOutlet var btnSignIn: UIButton!
    
    @IBAction func pushSignUp(_ sender: Any) {
        delegate?.signUp()
    }
    
    @IBAction func pushSignIn(_ sender: Any) {
        delegate?.signIn()
    }

}
