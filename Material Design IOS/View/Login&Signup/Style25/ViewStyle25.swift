//
//  ViewStyle25.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/1/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ViewStyle25Delegate {
    func SignIn()
    func SignUp()
}

class ViewStyle25: UIView {
    
    var delegate: ViewStyle25Delegate?
    @IBOutlet var logo: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var des: UILabel!
    @IBOutlet var btnSignIn: UIButton!
    @IBOutlet var btnSignUp: UIButton!
    
    @IBAction func pushSignIn(_ sender: Any) {
        delegate?.SignIn()
    }

    @IBAction func pushSignUp(_ sender: Any) {
        delegate?.SignUp()
    }
    
}
