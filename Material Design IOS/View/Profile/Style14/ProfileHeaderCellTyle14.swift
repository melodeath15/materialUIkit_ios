//
//  ProfileHeaderCellTyle14.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 11/10/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ProfileHeaderCellTyle14Delegate {
    func plush()
    func share()
}

class ProfileHeaderCellTyle14: UITableViewCell {
    
    var delegate: ProfileHeaderCellTyle14Delegate?
    @IBOutlet var profile: UIImageView!
    @IBOutlet var btnPlush: UIButton!
    @IBOutlet var btnShare: UIButton!
    @IBOutlet var name: UILabel!
    @IBOutlet var city: UILabel!
    @IBOutlet var imgBg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profile.layer.cornerRadius = profile.frame.size.width/2
        profile.clipsToBounds = true
        
        btnPlush.layer.cornerRadius = btnPlush.frame.size.width/2
        btnPlush.clipsToBounds = true
        
        btnShare.layer.borderColor = UIColor.groupTableViewBackground .cgColor
        btnShare.layer.borderWidth = 2
        btnShare.layer.cornerRadius = btnPlush.frame.size.width/2
        btnShare.clipsToBounds = true
        
    }
    
    @IBAction func pushBtnPlush(_ sender: Any) {
        delegate?.plush()
    }
    
    @IBAction func pushBtnShare(_ sender: Any) {
        delegate?.share()
    }
    
}
