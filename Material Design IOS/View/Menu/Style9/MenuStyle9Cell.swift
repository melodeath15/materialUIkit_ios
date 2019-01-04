//
//  MenuStyle9Cell.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/14/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class MenuStyle9Cell: UITableViewCell {
    
    @IBOutlet var viewIcon: UIView!
    @IBOutlet var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewIcon.layer.cornerRadius = viewIcon.frame.size.width/2
        viewIcon.clipsToBounds = true
        
    }
    
}
