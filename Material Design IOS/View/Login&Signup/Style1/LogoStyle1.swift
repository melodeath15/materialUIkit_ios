//
//  LogoStyle1.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/23/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class LogoStyle1: UITableViewCell {
    
    @IBOutlet var backgraundLogo: UIView!
    @IBOutlet var changeLogo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        changeLogo.layer.cornerRadius = changeLogo.frame.size.width/2
        changeLogo.clipsToBounds = true
    }
    
}
