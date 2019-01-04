//
//  EcommerceStyle30Cell.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/11/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle30CellDelegate {
    func shopNow(index: IndexPath)
}

class EcommerceStyle30Cell: UITableViewCell {
    
    var delegate: EcommerceStyle30CellDelegate?
    @IBOutlet var img: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var btnShopNow: UIButton!
    var index = IndexPath()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnShopNow.layer.borderColor = UIColor.white .cgColor
        btnShopNow.layer.borderWidth = 1
        btnShopNow.layer.cornerRadius = 5
        btnShopNow.clipsToBounds = true
        
    }
    
    @IBAction func pushBtnShopNow(_ sender: Any) {
        delegate?.shopNow(index: index)
    }
    
}
