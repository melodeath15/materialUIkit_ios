//
//  HeaderStyle9.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/29/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol HeaderStyle9Delegate {
    func SignIn()
}

class HeaderStyle9: UIView {
    
    var delegate: HeaderStyle9Delegate?
    @IBOutlet var logo: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var titleSignIn: UIButton!
    @IBOutlet var bgImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        logo.layer.cornerRadius = logo.frame.size.width/2
        logo.clipsToBounds = true
    }
    
    @IBAction func pushSIgnin(_ sender: Any) {
        delegate?.SignIn()
    }    
}
