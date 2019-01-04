//
//  WalkthroughStyle5Footer.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol WalkthroughStyle5FooterDelegate {
    func getStarted()
}

class WalkthroughStyle5Footer: UIView {
    
    var delegate: WalkthroughStyle5FooterDelegate?
    @IBOutlet var btnGetStarted: UIButton!
    
    @IBAction func pushBtnStarted(_ sender: Any) {
        delegate?.getStarted()
    }
    
}
