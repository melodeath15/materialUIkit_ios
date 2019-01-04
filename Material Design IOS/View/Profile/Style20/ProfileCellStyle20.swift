//
//  ProfileCellStyle20.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 11/13/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ProfileCellStyle20Delegate {
    func plush(index: IndexPath)
}

class ProfileCellStyle20: UITableViewCell {
    
    var delegate: ProfileCellStyle20Delegate?
    @IBOutlet var img: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var posisi: UILabel!
    @IBOutlet var btn: UIButton!
    var index = IndexPath()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        img.layer.cornerRadius = img.frame.size.width/2
        img.clipsToBounds = true
        
        btn.layer.cornerRadius = btn.frame.size.width/2
        btn.clipsToBounds = true
        
    }
    
    @IBAction func pushPlush(_ sender: Any) {
        delegate?.plush(index: index)
    }
}
