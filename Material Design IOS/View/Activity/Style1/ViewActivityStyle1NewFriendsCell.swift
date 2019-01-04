//
//  ViewActivityStyle1NewFriendsCell.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ViewActivityStyle1NewFriendsCell: UICollectionViewCell {
    
    @IBOutlet var imgCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgCell.layer.cornerRadius = imgCell.frame.size.height/2
        imgCell.clipsToBounds = true
        
    }
    
}
