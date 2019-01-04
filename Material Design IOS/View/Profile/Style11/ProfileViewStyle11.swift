//
//  ProfileViewStyle11.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 11/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ProfileViewStyle11Delegate {
    func email()
    func setting()
}

class ProfileViewStyle11: UIView {
    
    var delegate: ProfileViewStyle11Delegate?
    @IBOutlet var imgBg: UIImageView!
    @IBOutlet var profile: UIImageView!
    @IBOutlet var btnEmail: UIButton!
    @IBOutlet var btnSetting: UIButton!
    @IBOutlet var name: UILabel!
    @IBOutlet var city: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profile.layer.cornerRadius = profile.frame.size.width/2
        profile.clipsToBounds = true
        
    }
    
    @IBAction func pushBtnEmail(_ sender: Any) {
        delegate?.email()
    }
    
    @IBAction func pushBtnSetting(_ sender: Any) {
        delegate?.setting()
    }

    
}
