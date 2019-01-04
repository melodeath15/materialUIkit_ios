//
//  ProfileHeader1.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 10/31/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ProfileHeader1Delegate {
    func email()
    func setting()
}

class ProfileHeader1: UIView {
    
    var delegate: ProfileHeader1Delegate?
    @IBOutlet var imgBg: UIImageView!
    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet var btnSetting: UIButton!
    @IBOutlet var btnEmail: UIButton!
    @IBOutlet var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgProfile.layer.cornerRadius = imgProfile.layer.frame.size.width/2
        imgProfile.clipsToBounds = true
        
    }
    
    @IBAction func pushBtnEmail(_ sender: Any) {
        delegate?.email()
    }
    
    @IBAction func pushBtnSetting(_ sender: Any) {
        delegate?.setting()
    }
    
}
