//
//  ViewActivityStyle24.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/15/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ViewActivityStyle24: UITableViewCell {
    
    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    @IBOutlet var time: UILabel!
    @IBOutlet var viewContent: UIView!
    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var des: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        view1.layer.cornerRadius = view1.frame.size.width/2
        view1.clipsToBounds = true
        
        imgProfile.layer.cornerRadius = imgProfile.frame.size.width/2
        imgProfile.clipsToBounds = true
        
    }

    
}
