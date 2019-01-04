//
//  ProfileCellStyle8.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 11/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ProfileCellStyle8Delegate {
    func pushCell(index: IndexPath)
}

class ProfileCellStyle8: UITableViewCell {
    
    var delegate: ProfileCellStyle8Delegate?
    @IBOutlet var bgCell: UIView!
    @IBOutlet var img: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var valueLove: UILabel!
    @IBOutlet var valueView: UILabel!
    @IBOutlet var btnCell: UIButton!
    var index = IndexPath()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bgCell.layer.cornerRadius = 5
        bgCell.clipsToBounds = true
        
    }
    
    @IBAction func pushBtnCell(_ sender: Any) {
        delegate?.pushCell(index: index)
    }
    
}
