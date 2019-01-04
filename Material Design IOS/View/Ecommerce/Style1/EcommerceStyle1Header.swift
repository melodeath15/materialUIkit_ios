//
//  EcommerceStyle1Header.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/2/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle1HeaderDelegate {
    func menu()
    func buy()
}

class EcommerceStyle1Header: UIView {
    
    var delegate: EcommerceStyle1HeaderDelegate?
    @IBOutlet var title: UILabel!
    @IBOutlet var btnMenu: UIButton!
    @IBOutlet var btnBuy: UIButton!
    
    @IBAction func pushBtnMenu(_ sender: Any) {
        delegate?.menu()
    }
    
    @IBAction func pushBtnBuy(_ sender: Any) {
        delegate?.buy()
    }
}
