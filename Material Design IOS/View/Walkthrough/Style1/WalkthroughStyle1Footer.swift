//
//  WalkthroughStyle1Footer.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/4/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol WalkthroughStyle1FooterDelegate {
    func started()
}

class WalkthroughStyle1Footer: UIView {
    
    var delegate: WalkthroughStyle1FooterDelegate?
    @IBOutlet var btnStarted: UIButton!
    
    @IBAction func pushBtnStarted(_ sender: Any) {
        delegate?.started()
    }
    
}
