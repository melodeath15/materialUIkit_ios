//
//  EcommerceStyle18Footer.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/9/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle18FooterDelegate {
    func addCart()
    func addWishlist()
}

class EcommerceStyle18Footer: UITableViewCell {
    
    var delegate: EcommerceStyle18FooterDelegate?
    @IBOutlet var btnAddCart: UIButton!
    @IBOutlet var btnAddWishlist: UIButton!
    
    @IBAction func pushBtnAddCart(_ sender: Any) {
        delegate?.addCart()
    }
    
    @IBAction func pushBtnAddWishlist(_ sender: Any) {
        delegate?.addWishlist()
    }
    
}
