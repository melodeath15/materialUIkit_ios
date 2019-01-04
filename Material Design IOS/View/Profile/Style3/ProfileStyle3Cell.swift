//
//  ProfileStyle3Cell.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 11/2/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ProfileStyle3CellDelegate {
    func pushCell(index: IndexPath)
}

class ProfileStyle3Cell: UITableViewCell {
    
    var delegate: ProfileStyle3CellDelegate?
    @IBOutlet var img: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var city: UILabel!
    var index = IndexPath()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        img.layer.cornerRadius = img.frame.size.width/2
        img.clipsToBounds = true
        
    }
    
    @IBAction func pushBtnCell(_ sender: Any) {
        delegate?.pushCell(index: index)
    }
    
}
