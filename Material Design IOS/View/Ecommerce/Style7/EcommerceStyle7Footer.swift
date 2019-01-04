//
//  EcommerceStyle7Footer.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/3/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle7FooterDelegate {
    func addCart()
    func buyNow()
}

class EcommerceStyle7Footer: UIView {
    
    var delegate: EcommerceStyle7FooterDelegate?
    @IBOutlet var btnBuy: UIButton!
    @IBOutlet var btnAdd: UIButton!
    
    @IBAction func pushBtnBuy(_ sender: Any) {
        delegate?.buyNow()
    }
    
    @IBAction func pushBtnAdd(_ sender: Any) {
        delegate?.addCart()
    }
    
}
