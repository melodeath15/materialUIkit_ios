//
//  ProfileFooterStyle9.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 11/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ProfileFooterStyle9Delegate {
    func follow()
    func viewProfile()
}

class ProfileFooterStyle9: UIView {
    
    var delegate: ProfileFooterStyle9Delegate?
    @IBOutlet var btnFollow: UIButton!
    @IBOutlet var btnViewProfile: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnFollow.layer.cornerRadius = 5
        btnFollow.clipsToBounds = true
        
        btnViewProfile.layer.cornerRadius = 5
        btnViewProfile.clipsToBounds = true
        
    }
    
    @IBAction func pushBtnFollow(_ sender: Any) {
        delegate?.follow()
    }
    
    @IBAction func pushBtnViewProfile(_ sender: Any) {
        delegate?.viewProfile()
    }
    
}
