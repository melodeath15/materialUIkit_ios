//
//  WalkthroughStyle16Footer.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol WalkthroughStyle16FooterDelegate {
    func started()
}

class WalkthroughStyle16Footer: UIView {
    
    var delegate: WalkthroughStyle16FooterDelegate?
    @IBOutlet var btnStarted: UIButton!
    
    
    @IBAction func pushBtnStarted(_ sender: Any) {
        delegate?.started()
    }
}
