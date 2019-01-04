//
//  EcommerceStyle27Footer.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/11/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle27FooterDelegate {
    func pushOk()
}

class EcommerceStyle27Footer: UIView {
    
    var delegate: EcommerceStyle27FooterDelegate?
    @IBOutlet var btnOk: UIButton!
    
    @IBAction func pushBtnOk(_ sender: Any) {
        delegate?.pushOk()
    }
    
}
