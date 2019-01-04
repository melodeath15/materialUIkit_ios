//
//  GalleryStyle6Header.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/21/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol GalleryStyle6HeaderDelegate {
    func menu()
    func search()
    func optional()
    func share()
}

class GalleryStyle6Header: UIView {
    
    var delegate: GalleryStyle6HeaderDelegate?
    @IBOutlet var btnMenu: UIButton!
    @IBOutlet var title: UILabel!
    @IBOutlet var btnSearch: UIButton!
    @IBOutlet var btnOptional: UIButton!
    @IBOutlet var btmShare: UIButton!
    
    @IBAction func pushBtnMenu(_ sender: Any) {
        delegate?.menu()
    }
    
    @IBAction func pushBtnSearch(_ sender: Any) {
        delegate?.search()
    }
    
    @IBAction func pushBtnOptional(_ sender: Any) {
        delegate?.optional()
    }
    
    @IBAction func pushBtnShare(_ sender: Any) {
        delegate?.share()
    }
}
