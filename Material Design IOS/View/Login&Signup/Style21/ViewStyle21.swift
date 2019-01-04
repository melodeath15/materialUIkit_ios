//
//  ViewStyle21.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/1/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ViewStyle21Delegate {
    func signin()
}

class ViewStyle21: UIView {
    
    var delegate: ViewStyle21Delegate?
    @IBOutlet var logo: UIImageView!
    @IBOutlet var buttonSign: UIButton!
    
    @IBAction func pushSignIn(_ sender: Any) {
        delegate?.signin()
    }
}
