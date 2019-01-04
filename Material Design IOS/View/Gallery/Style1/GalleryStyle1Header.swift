//
//  GalleryStyle1Header.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/19/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol GalleryStyle1HeaderDelegate {
    func menu()
    func search()
    func optional()
}

class GalleryStyle1Header: UIView {
    
    var delegate: GalleryStyle1HeaderDelegate?
    @IBOutlet var btnMenu: UIButton!
    @IBOutlet var title: UILabel!
    @IBOutlet var btnSearch: UIButton!
    @IBOutlet var btnOptional: UIButton!
    
    @IBAction func pushBtnMenu(_ sender: Any) {
        delegate?.menu()
    }
    
    @IBAction func pushBtnSearch(_ sender: Any) {
        delegate?.search()
    }
    
    @IBAction func pushBtnOptional(_ sender: Any) {
        delegate?.optional()
    }
    
}
