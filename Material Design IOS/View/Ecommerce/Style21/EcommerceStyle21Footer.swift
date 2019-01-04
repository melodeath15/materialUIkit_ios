//
//  EcommerceStyle21Footer.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/10/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle21FooterDelegate {
    func checkout()
}

class EcommerceStyle21Footer: UIView {

    var delegate: EcommerceStyle21FooterDelegate?
    @IBOutlet var btnCheckout: UIButton!
    @IBOutlet var labelTotalPrice: UILabel!
    @IBOutlet var valuePrice: UILabel!
    
    @IBAction func pushBtnCheckout(_ sender: Any) {
        delegate?.checkout()
    }
    
}
