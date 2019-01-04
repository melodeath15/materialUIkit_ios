//
//  ProfileHeaderCellStyle16.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 11/10/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ProfileHeaderCellStyle16: UITableViewCell {
    
    @IBOutlet var imgBG: UIImageView!
    @IBOutlet var profile: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var follow: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profile.layer.cornerRadius = profile.frame.size.width/2
        profile.clipsToBounds = true
        
    }
    
}
