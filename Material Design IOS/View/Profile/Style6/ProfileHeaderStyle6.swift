//
//  ProfileHeaderStyle6.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 11/3/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ProfileHeaderStyle6Delegate {
    func plus()
}

class ProfileHeaderStyle6: UIView {
    
    var delegate: ProfileHeaderStyle6Delegate?
    @IBOutlet var img: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var title: UILabel!
    @IBOutlet var btnPlush: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        img.layer.cornerRadius = img.frame.size.width/2
        img.clipsToBounds = true
        
        btnPlush.layer.cornerRadius = btnPlush.frame.size.width/2
        btnPlush.clipsToBounds = true
        
    }
    
    @IBAction func pushBtnPlush(_ sender: Any) {
        delegate?.plus()
    }
    
}
