//
//  EcommerceStyle14Footer.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/8/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle14FooterDelegate {
    func size()
    func qty()
    func addCart()
}

class EcommerceStyle14Footer: UIView {
    
    var delegate: EcommerceStyle14FooterDelegate?
    @IBOutlet var btnSize: UIButton!
    @IBOutlet var btnQty: UIButton!
    @IBOutlet var btnAddCart: UIButton!
    
    @IBAction func pushBtnSize(_ sender: Any) {
        delegate?.size()
    }
    
    @IBAction func pushBtnQty(_ sender: Any) {
        delegate?.qty()
    }
    
    @IBAction func pushBtnAddCart(_ sender: Any) {
        delegate?.addCart()
    }
    
}
