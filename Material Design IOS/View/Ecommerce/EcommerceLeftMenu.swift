//
//  EcommerceLeftMenu.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/2/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceLeftMenuDelegate {
    func backVC()
}

class EcommerceLeftMenu: UIView {
    
    var delegate: EcommerceLeftMenuDelegate?
    @IBOutlet var iconBack: UIImageView!
    @IBOutlet var titleBack: UILabel!
    @IBOutlet var btnBack: UIButton!
    
    @IBAction func pushBtnBack(_ sender: Any) {
        delegate?.backVC()
    }
}
