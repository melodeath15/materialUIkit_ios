//
//  EcommerceStyle27View.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/11/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceStyle27View: UIView {
    
    @IBOutlet var viewCentang: UIView!
    @IBOutlet var imgCentang: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var des: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewCentang.layer.cornerRadius = viewCentang.frame.size.width/2
        viewCentang.clipsToBounds = true
        
    }
    
}
