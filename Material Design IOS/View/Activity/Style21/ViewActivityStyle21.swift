//
//  ViewActivityStyle21.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/14/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ViewActivityStyle21: UITableViewCell {
    
    @IBOutlet var viewCell: UIView!
    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet var titile: UILabel!
    @IBOutlet var des: UILabel!
    @IBOutlet var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgProfile.layer.cornerRadius = imgProfile.frame.size.width/2
        imgProfile.clipsToBounds = true
        
    }
    
}
