//
//  ViewActivityStyle2Photo.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ViewActivityStyle2Photo: UITableViewCell {
    
    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var PostedPhoto: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var detail: UILabel!
    @IBOutlet var valueLove: UILabel!
    @IBOutlet var valueView: UILabel!
    @IBOutlet var valueTime: UILabel!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgProfile.layer.cornerRadius = imgProfile.frame.size.width/2
        imgProfile.clipsToBounds = true
        
    }
    
}
