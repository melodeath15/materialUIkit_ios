//
//  Style8Back.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/29/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol Style8BackDelegate {
    func backMenu()
}

class Style8Back: UITableViewCell {
    
    var delegate: Style8BackDelegate?
    @IBOutlet var buttonBack: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func pushBack(_ sender: Any) {
        delegate?.backMenu()
    }
}
