//
//  EcommerceStyle13View.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle13ViewDelegate {
    func productSize()
    func productQty()
}

class EcommerceStyle13View: UITableViewCell {
    
    var delegate: EcommerceStyle13ViewDelegate?
    @IBOutlet var title: UILabel!
    @IBOutlet var tagTitle: UILabel!
    @IBOutlet var price: UILabel!
    @IBOutlet var btnSIze: UIButton!
    @IBOutlet var btnQty: UIButton!
    @IBOutlet var titleDes: UILabel!
    @IBOutlet var valueDes: UILabel!
    
    @IBAction func pushBtnSize(_ sender: Any) {
        delegate?.productSize()
    }
    
    @IBAction func pushBtnQty(_ sender: Any) {
        delegate?.productQty()
    }
    
}
