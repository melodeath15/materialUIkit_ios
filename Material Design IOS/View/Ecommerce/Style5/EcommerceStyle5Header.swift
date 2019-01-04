//
//  EcommerceStyle5Header.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/3/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle5HeaderDelegate {
    func shop()
}

class EcommerceStyle5Header: UITableViewCell {
    
    var delegate: EcommerceStyle5HeaderDelegate?
    @IBOutlet var img: UIImageView!
    @IBOutlet var nameCatalog: UILabel!
    @IBOutlet var title: UILabel!
    @IBOutlet var btnShop: UIButton!
    
    @IBAction func pushBtnShop(_ sender: Any) {
        delegate?.shop()
    }
    
}
