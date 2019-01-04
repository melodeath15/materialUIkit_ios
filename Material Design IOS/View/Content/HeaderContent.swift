//
//  HeaderContent.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 1/19/18.
//  Copyright © 2018 Mediatechindo. All rights reserved.
//

import UIKit

protocol HeaderContentDelegate {
    func search()
    func optional()
}

class HeaderContent: UIView {
    
    var delegate: HeaderContentDelegate?
    @IBOutlet var btnMenu: UIButton!
    @IBOutlet var title: UILabel!
    @IBOutlet var btnSearch: UIButton!
    @IBOutlet var btnOptional: UIButton!
    
    @IBAction func pushBtnSearch(_ sender: Any) {
        delegate?.search()
    }
    
    @IBAction func pushBtnOptional(_ sender: Any) {
        delegate?.optional()
    }

    
}
