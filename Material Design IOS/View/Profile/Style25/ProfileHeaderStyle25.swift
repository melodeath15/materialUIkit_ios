//
//  ProfileHeaderStyle25.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 11/14/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ProfileHeaderStyle25: UIView {
    
    @IBOutlet var img: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var posisi: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        img.layer.cornerRadius = img.frame.size.width/2
        img.clipsToBounds = true
        
    }
    
}
