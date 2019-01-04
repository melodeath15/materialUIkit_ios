//
//  ProfileHeaderStyle5.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 11/3/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ProfileHeaderStyle5Delegate {
    func follow()
    func share()
}

class ProfileHeaderStyle5: UIView {
    
    var delegate: ProfileHeaderStyle5Delegate?
    @IBOutlet var img: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var follow: UIButton!
    @IBOutlet var share: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        img.layer.cornerRadius = img.frame.size.width/2
        img.clipsToBounds = true
        
        follow.layer.cornerRadius = 5
        follow.clipsToBounds = true
        
        share.layer.cornerRadius = 5
        share.clipsToBounds = true
        
    }
    
    @IBAction func pushBtnFollow(_ sender: Any) {
        delegate?.follow()
    }
    
    @IBAction func pushBtnShare(_ sender: Any) {
        delegate?.share()
    }
    
}
