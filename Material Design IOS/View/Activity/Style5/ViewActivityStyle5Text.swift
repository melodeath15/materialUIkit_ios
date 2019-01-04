//
//  ViewActivityStyle5Text.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ViewActivityStyle5Text: UITableViewCell {
    
    @IBOutlet var img: UIImageView!
    @IBOutlet var Title: UILabel!
    @IBOutlet var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        img.layer.cornerRadius = img.frame.size.width/2
        img.clipsToBounds = true
        
    }
    
}
