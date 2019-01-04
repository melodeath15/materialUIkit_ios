//
//  MenuStyle20Footer.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/18/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol MenuStyle20FooterDelegate {
    func logout()
}

class MenuStyle20Footer: UIView {
    
    var delegate: MenuStyle20FooterDelegate?
    @IBOutlet var btnLogout: UIButton!
    
    @IBAction func pushBtnLogout(_ sender: Any) {
        delegate?.logout()
    }
    
}
