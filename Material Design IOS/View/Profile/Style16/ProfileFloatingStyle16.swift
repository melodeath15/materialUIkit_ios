//
//  ProfileFloatingStyle16.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 11/10/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ProfileFloatingStyle16Delegate {
    func floating()
}

class ProfileFloatingStyle16: UIView {
    
    var delegate: ProfileFloatingStyle16Delegate?
    @IBOutlet var floating: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        floating.layer.cornerRadius = floating.frame.size.width/2
        floating.clipsToBounds = true
        
    }
    
    @IBAction func pushBtnFloating(_ sender: Any) {
        delegate?.floating()
    }
    
}
