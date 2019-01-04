//
//  ProfileCellStyle6.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 11/3/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ProfileCellStyle6Delegate {
    func pushCell(index: IndexPath)
}

class ProfileCellStyle6: UITableViewCell {
    
    var delegate: ProfileCellStyle6Delegate?
    @IBOutlet var img: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var counter: UILabel!
    var index = IndexPath()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        img.layer.cornerRadius = 5
        img.clipsToBounds = true
        
    }
    
    @IBAction func pushBtnCell(_ sender: Any) {
        delegate?.pushCell(index: index)
    }
    
}
