//
//  ProfileHeader.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 10/31/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ProfileHeaderDelegate {
    func search()
    func optional()
}

class ProfileHeader: UIView {
    
    var delegate: ProfileHeaderDelegate?
    @IBOutlet var btnMenu: UIButton!
    @IBOutlet var title: UILabel!
    @IBOutlet var btnSearch: UIButton!
    @IBOutlet var btnOptional: UIButton!
        
    @IBAction func pushBtnSearch(_ sender: Any) {
        delegate?.search()
    }
    
    @IBAction func pushBtnOptional(_ sender: Any) {
        delegate?.optional()
    }
    
}
