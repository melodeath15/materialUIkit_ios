//
//  ProfileCellPhotoStyle19.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 11/13/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ProfileCellPhotoStyle19: UITableViewCell {
    
    @IBOutlet var Profile: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var posisi: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        Profile.layer.cornerRadius = Profile.frame.size.width/2
        Profile.clipsToBounds = true
        
    }
    
}
