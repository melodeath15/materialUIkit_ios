//
//  EcommerceStyle17Footer.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/8/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle17FooterDelegate {
    func color()
    func qty()
    func addCart()
    func addWishlis()
}

class EcommerceStyle17Footer: UITableViewCell {
    
    var delegate: EcommerceStyle17FooterDelegate?
    @IBOutlet var btnColor: UIButton!
    @IBOutlet var btnQty: UIButton!
    @IBOutlet var valueColor: UIView!
    @IBOutlet var btnAddCart: UIButton!
    @IBOutlet var btnAddWishlist: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        valueColor.layer.cornerRadius = 5
        valueColor.clipsToBounds = true
        
    }
    
    @IBAction func pushBtnColor(_ sender: Any) {
        delegate?.color()
    }
    
    @IBAction func pushBtnQty(_ sender: Any) {
        delegate?.qty()
    }
    
    @IBAction func pushBtnAddCart(_ sender: Any) {
        delegate?.addCart()
    }
    
    @IBAction func pushBtnAddWishlist(_ sender: Any) {
        delegate?.addWishlis()
    }    
    
}
