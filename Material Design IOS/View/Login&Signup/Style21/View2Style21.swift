//
//  View2Style21.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/1/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol View2Style21Delegate {
    func signup()
}

class View2Style21: UIView {
    
    var delegate: View2Style21Delegate?
    @IBOutlet var logo: UIImageView!
    @IBOutlet var buttonSign: UIButton!
    
    @IBAction func pushSignIn(_ sender: Any) {
        delegate?.signup()
    }
}
