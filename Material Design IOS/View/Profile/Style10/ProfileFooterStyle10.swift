//
//  ProfileFooterStyle10.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 11/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ProfileFooterStyle10Delegate {
    func followMe()
}

class ProfileFooterStyle10: UIView {
    
    var delegate: ProfileFooterStyle10Delegate?
    @IBOutlet var btnFollow: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnFollow.layer.cornerRadius = 5
        btnFollow.clipsToBounds = true
        
    }
    
    @IBAction func pushBtnFollow(_ sender: Any) {
        delegate?.followMe()
    }
    
    
}
