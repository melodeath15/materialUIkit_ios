//
//  WalkthroughStyle1Header.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/4/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol WalkthroughStyle1HeaderDelegate {
    func Menu()
    
}

class WalkthroughStyle1Header: UIView {
    
    var delegate: WalkthroughStyle1HeaderDelegate?
    @IBOutlet var btnMenu: UIButton!
    @IBOutlet var title: UILabel!
    
    @IBAction func pushBtnMenu(_ sender: Any) {
        delegate?.Menu()
    }
    
}
