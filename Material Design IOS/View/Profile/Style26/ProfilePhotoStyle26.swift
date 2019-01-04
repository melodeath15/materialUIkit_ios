//
//  ProfilePhotoStyle26.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 11/14/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ProfilePhotoStyle26: UIView {
    
    @IBOutlet var profile: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var city: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profile.layer.cornerRadius = profile.frame.size.width/2
        profile.clipsToBounds = true
        
    }
    
}
