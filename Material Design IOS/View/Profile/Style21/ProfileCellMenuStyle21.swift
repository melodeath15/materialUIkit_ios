//
//  ProfileCellMenuStyle21.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 11/13/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ProfileCellMenuStyle21Delegate {
    func Educ()
    func expe()
    func skil()
    func Serv()
}

class ProfileCellMenuStyle21: UITableViewCell {
    
    var delegate: ProfileCellMenuStyle21Delegate?
    
    @IBAction func pushEducation(_ sender: Any) {
        delegate?.Educ()
    }
    
    @IBAction func pushExperience(_ sender: Any) {
        delegate?.expe()
    }
    
    @IBAction func pushSkill(_ sender: Any) {
        delegate?.skil()
    }
    
    @IBAction func pushService(_ sender: Any) {
        delegate?.Serv()
    }
    
}


