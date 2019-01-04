//
//  MenuStyle16Header.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/17/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class MenuStyle16Header: UIView {
    
    @IBOutlet var viewBg: UIView!
    @IBOutlet var name: UILabel!
    @IBOutlet var city: UILabel!
    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet var viewValue: UIView!
    @IBOutlet var valueNotif: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    
        imgProfile.layer.cornerRadius = imgProfile.frame.size.width/2
        imgProfile.clipsToBounds = true
        
        viewValue.layer.cornerRadius = viewValue.frame.size.width/2
        viewValue.clipsToBounds = true
        
    }
    
}
