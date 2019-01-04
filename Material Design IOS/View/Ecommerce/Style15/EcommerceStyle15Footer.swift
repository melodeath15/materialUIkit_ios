//
//  EcommerceStyle15Footer.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/8/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle15FooterDelegate {
    func addCart()
}

class EcommerceStyle15Footer: UIView {
    
    var delegate: EcommerceStyle15FooterDelegate?
    @IBOutlet var viewPrice: UIView!
    @IBOutlet var valuePrice: UILabel!
    @IBOutlet var btnAddCart: UIButton!
    
    @IBAction func pushBtnAddCart(_ sender: Any) {
        delegate?.addCart()
    }
}
