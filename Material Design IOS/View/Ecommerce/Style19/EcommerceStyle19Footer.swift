//
//  EcommerceStyle19Footer.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/9/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle19FooterDelegate {
    func addCart()
}

class EcommerceStyle19Footer: UIView {
    
    var delegate: EcommerceStyle19FooterDelegate?
    @IBOutlet var btnAddCart: UIButton!
    
    @IBAction func pushBtnAddCart(_ sender: Any) {
        delegate?.addCart()
    }
}
