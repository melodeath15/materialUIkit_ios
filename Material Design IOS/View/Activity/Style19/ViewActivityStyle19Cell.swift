//
//  ViewActivityStyle19Cell.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/13/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ViewActivityStyle19Cell: UICollectionViewCell {
    
    @IBOutlet var imgCell: UIImageView!
    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var valueLove: UILabel!
    @IBOutlet var valueComment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgProfile.layer.cornerRadius = imgProfile.frame.size.width/2
        imgProfile.clipsToBounds = true
        
    }

}
