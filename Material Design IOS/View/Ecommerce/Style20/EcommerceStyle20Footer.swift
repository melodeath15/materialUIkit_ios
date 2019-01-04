//
//  EcommerceStyle20Footer.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/9/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle20FooterDelegate {
    func applyFilter()
}

class EcommerceStyle20Footer: UIView {
    
    var delegate: EcommerceStyle20FooterDelegate?
    @IBOutlet var btnFilter: UIButton!
    
    @IBAction func pushBtnFilter(_ sender: Any) {
        delegate?.applyFilter()
    }
}
