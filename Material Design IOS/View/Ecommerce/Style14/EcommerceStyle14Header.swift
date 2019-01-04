//
//  EcommerceStyle14Header.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle14HeaderDelegate {
    func love()
}

class EcommerceStyle14Header: UITableViewCell {
    
    var delegate: EcommerceStyle14HeaderDelegate?
    @IBOutlet var img: UIImageView!
    @IBOutlet var btnLove: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnLove.layer.cornerRadius = btnLove.frame.size.width/2
        btnLove.clipsToBounds = true
        
    }
    
    @IBAction func pushBtnLove(_ sender: Any) {
        delegate?.love()
    }
}
