//
//  ProfileStyle2Cell.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 11/2/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ProfileStyle2Cell: UICollectionViewCell {
    
    @IBOutlet var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        img.layer.cornerRadius = 5
        img.clipsToBounds = true
        
    }
    
}
