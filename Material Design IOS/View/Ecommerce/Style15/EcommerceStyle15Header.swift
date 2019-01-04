//
//  EcommerceStyle15Header.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/8/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle15HeaderDelegate {
    func menu()
    func search()
    func buy()
    func optional()
}

class EcommerceStyle15Header: UIView {
    
    var delegate: EcommerceStyle15HeaderDelegate?
    @IBOutlet var btnMenu: UIButton!
    @IBOutlet var title: UILabel!
    @IBOutlet var btnSearch: UIButton!
    @IBOutlet var btnBuy: UIButton!
    @IBOutlet var btnOptional: UIButton!
    
    @IBAction func pushBtnMenu(_ sender: Any) {
        delegate?.menu()
    }
    
    @IBAction func pushBtnSearch(_ sender: Any) {
        delegate?.search()
    }
    
    @IBAction func pushBtnBuy(_ sender: Any) {
        delegate?.buy()
    }

    @IBAction func pushBtnOptional(_ sender: Any) {
        delegate?.optional()
    }
    
}
