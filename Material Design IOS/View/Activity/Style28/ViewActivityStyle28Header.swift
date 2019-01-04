//
//  ViewActivityStyle28Header.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/19/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ViewActivityStyle28Header: UITableViewCell {
    @IBOutlet var imgHeader: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var imgProfile: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imgProfile.layer.cornerRadius = self.imgProfile.frame.size.width/2
        self.imgProfile.clipsToBounds = true
        
    }
    
}
