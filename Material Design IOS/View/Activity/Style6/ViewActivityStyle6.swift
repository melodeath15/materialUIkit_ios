//
//  ViewActivityStyle6.swift
//  Material Design IOS
//
//  Created by yanuar prisantoso on 6/8/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ViewActivityStyle6: UICollectionViewCell {
    
    @IBOutlet var bgcell: UIImageView!
    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet var valueLove: UILabel!
    @IBOutlet var valueView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgProfile.layer.cornerRadius = imgProfile.frame.size.width/2
        imgProfile.clipsToBounds = true
        
    }
}
