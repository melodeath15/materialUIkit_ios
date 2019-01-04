//
//  ViewActivityStyle10.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/9/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ViewActivityStyle10: UITableViewCell {
    
    @IBOutlet var bgCell: UIImageView!
    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var title: UILabel!
    @IBOutlet var des: UILabel!
    
    @IBOutlet var valueLove: UILabel!
    @IBOutlet var valueView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgProfile.layer.cornerRadius = imgProfile.frame.size.width/2
        imgProfile.clipsToBounds = true
        
    }
    
}
