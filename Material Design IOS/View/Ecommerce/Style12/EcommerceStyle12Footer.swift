//
//  EcommerceStyle12Footer.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle12FooterDelegate {
    func AddCart()
}

class EcommerceStyle12Footer: UIView {
    
    var delegate: EcommerceStyle12FooterDelegate?
    @IBOutlet var BtnAddCart: UIButton!
    
    @IBAction func pushBtnAddCart(_ sender: Any) {
        delegate?.AddCart()
    }
    
}
