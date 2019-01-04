//
//  MenuStyle6Header.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/13/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class MenuStyle6Header: UIView {
    
    @IBOutlet var imgBg: UIImageView!
    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var city: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgProfile.layer.cornerRadius = imgProfile.frame.size.width/2
        imgProfile.clipsToBounds = true
        
    }
    
}
