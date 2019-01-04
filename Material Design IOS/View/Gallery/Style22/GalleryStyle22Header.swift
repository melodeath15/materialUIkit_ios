//
//  GalleryStyle22Header.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/28/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol GalleryStyle22HeaderDelegate {
    func menu()
    func Optional()
}

class GalleryStyle22Header: UIView {
    
    var delegate: GalleryStyle22HeaderDelegate?
    @IBOutlet var btnMenu: UIButton!
    @IBOutlet var title: UILabel!
    @IBOutlet var countImg: UILabel!
    @IBOutlet var btnOptional: UIButton!
    
    @IBAction func pushBtnMenu(_ sender: Any) {
        delegate?.menu()
    }
    
    @IBAction func pushBtnOptional(_ sender: Any) {
        delegate?.Optional()
    }
    
}
