//
//  ProfileHeaderViewStyle27.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 11/14/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ProfileHeaderViewStyle27Delegate {
    func plush()
}

class ProfileHeaderViewStyle27: UIView {
    
    var delegate: ProfileHeaderViewStyle27Delegate?
    @IBOutlet var profile: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var profesi: UILabel!
    @IBOutlet var btnPlush: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profile.layer.cornerRadius = profile.frame.size.width/2
        profile.clipsToBounds = true
        
        btnPlush.layer.cornerRadius = btnPlush.frame.size.width/2
        btnPlush.clipsToBounds = true
        
    }
    
    @IBAction func pushBtnPlush(_ sender: Any) {
        delegate?.plush()
    }
    
}
