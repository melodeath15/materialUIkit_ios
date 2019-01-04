//
//  ProfileFooterStyle3.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 11/2/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ProfileFooterStyle3Delegate {
    func Follow()
}

class ProfileFooterStyle3: UIView {
    
    var delegate: ProfileFooterStyle3Delegate?
    @IBOutlet var btnFollow: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnFollow.layer.cornerRadius = 5
        btnFollow.clipsToBounds = true
        
    }
    
    @IBAction func pushBtnFollow(_ sender: Any) {
        delegate?.Follow()
    }
    
}
