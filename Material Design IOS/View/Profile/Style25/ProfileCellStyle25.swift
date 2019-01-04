//
//  ProfileCellStyle25.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 11/14/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ProfileCellStyle25: UITableViewCell {
    
    @IBOutlet var profile: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var deskripsi: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profile.layer.cornerRadius = 5
        profile.clipsToBounds = true
        
    }
    
}
