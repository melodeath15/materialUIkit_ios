//
//  EcommerceStyle24Footer.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/10/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle24FooterDelegate {
    func next()
}

class EcommerceStyle24Footer: UIView {
    
    var delegate: EcommerceStyle24FooterDelegate?
    @IBOutlet var labelSubtotal: UILabel!
    @IBOutlet var labelCost: UILabel!
    @IBOutlet var LabelTotal: UILabel!
    @IBOutlet var valueSubtotal: UILabel!
    @IBOutlet var valueOldSubtotal: UILabel!
    @IBOutlet var valueCost: UILabel!
    @IBOutlet var valueTotal: UILabel!
    @IBOutlet var btnNext: UIButton!
    
    @IBAction func pushBtnNext(_ sender: Any) {
        delegate?.next()
    }
    
}
