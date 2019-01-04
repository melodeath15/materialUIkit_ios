//
//  MenuStyle9Footer.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/14/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol MenuStyle9FooterDelegate {
    func logout()
}

class MenuStyle9Footer: UIView {
    
    var delegate: MenuStyle9FooterDelegate?
    @IBOutlet var btnLogout: UIButton!
    
    @IBAction func pushBtnLogout(_ sender: Any) {
        delegate?.logout()
    }

}
