//
//  WalkthroughStyle1View.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/11/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class WalkthroughStyle1View: UIView {
    
    @IBOutlet var bg: UIView!
    @IBOutlet var img: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var des: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        img.layer.cornerRadius = img.frame.size.width/2
        img.clipsToBounds = true
        
    }
    
}
