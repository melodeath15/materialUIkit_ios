//
//  EcommerceStyle9Header.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/4/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle9HeaderDelegate {
    func munu()
    func search()
    func optional()
}

class EcommerceStyle9Header: UIView {
    
    var delegate: EcommerceStyle9HeaderDelegate?
    
    @IBOutlet var title: UILabel!
    @IBOutlet var btnMenu: UIButton!
    @IBOutlet var btnSearch: UIButton!
    @IBOutlet var btnOptional: UIButton!
    
    @IBAction func pushBtnMenu(_ sender: Any) {
        delegate?.munu()
    }
    
    @IBAction func pushBtnSearch(_ sender: Any) {
        delegate?.search()
    }
    
    @IBAction func pushBtnOptional(_ sender: Any) {
        delegate?.optional()
    }

}
