//
//  GalleryStyle1Cell.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/19/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class GalleryStyle1Cell: UICollectionViewCell {
    
    @IBOutlet var img: UIImageView!
    @IBOutlet var value: UILabel!
    @IBOutlet var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        img.layer.cornerRadius = 5
        img.clipsToBounds = true
        
    }
    
}
