//
//  ButtonStyle2.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/24/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ButtonStyle2Delegate {
    func cretaeAccount()
}

class ButtonStyle2: UITableViewCell {
    
    var delegate: ButtonStyle2Delegate?
    @IBOutlet var changeButton: UIButton!
    
    @IBAction func pushAccount(_ sender: Any) {
        delegate?.cretaeAccount()
    }
    
}
