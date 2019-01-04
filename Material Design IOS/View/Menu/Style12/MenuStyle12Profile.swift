//
//  MenuStyle12Profile.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/14/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class MenuStyle12Profile: UIView {
    
    @IBOutlet var img: UIImageView!
    @IBOutlet var viewNotif: UIView!
    @IBOutlet var valueNotif: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        img.layer.cornerRadius = img.frame.size.width/2
        img.clipsToBounds = true
        
        viewNotif.layer.cornerRadius = viewNotif.frame.size.width/2
        viewNotif.clipsToBounds = true
        
    }
}
