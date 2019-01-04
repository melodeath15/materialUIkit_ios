//
//  WalkthroughStyle20Header.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol WalkthroughStyle20HeaderDelegate {
    func close()
}

class WalkthroughStyle20Header: UIView{
    
    var delegate: WalkthroughStyle20HeaderDelegate?
    @IBOutlet var btnClose: UIButton!
    
    @IBAction func pushBtnClose(_ sender: Any) {
        delegate?.close()
    }
}
