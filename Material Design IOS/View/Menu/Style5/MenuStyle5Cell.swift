//
//  MenuStyle5Cell.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/13/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class MenuStyle5Cell: UITableViewCell {
    
    @IBOutlet var nameCell: UILabel!
    @IBOutlet var viewNumber: UIView!
    @IBOutlet var valueNumber: UILabel!
    @IBOutlet var iconNext: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewNumber.layer.cornerRadius = viewNumber.frame.size.width/2
        viewNumber.clipsToBounds = true

    }
    
}
