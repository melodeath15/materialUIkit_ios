//
//  ProfileHeaderStyle12.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 11/9/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ProfileHeaderStyle12Delegate {
    func plush()
}

class ProfileHeaderStyle12: UIView {
    
    var delegate: ProfileHeaderStyle12Delegate?
    @IBOutlet var img: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var city: UILabel!
    @IBOutlet var btnPlush: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        img.layer.cornerRadius = img.frame.size.width/2
        img.clipsToBounds = true
        
        btnPlush.layer.cornerRadius = btnPlush.frame.size.width/2
        btnPlush.clipsToBounds = true
        
    }
    
    @IBAction func pushBTnPlush(_ sender: Any) {
        delegate?.plush()
    }
    
}
