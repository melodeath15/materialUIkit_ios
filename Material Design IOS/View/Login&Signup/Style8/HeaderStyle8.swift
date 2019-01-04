//
//  HeaderStyle8.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/29/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class HeaderStyle8: UITableViewCell {
    
    @IBOutlet var bgImage: UIImageView!
    @IBOutlet var logo: UIImageView!
    @IBOutlet var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        logo.layer.cornerRadius = logo.frame.size.width/2
        logo.clipsToBounds = true
    }
}
