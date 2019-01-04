//
//  WalkthroughStyle7Footer.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol WalkthroughStyle7FooterDelegate {
    func signIn()
    func skip()
}

class WalkthroughStyle7Footer: UIView {
    
    var delegate: WalkthroughStyle7FooterDelegate?
    
    @IBOutlet var btnSignIn: UIButton!
    @IBOutlet var btnSkip: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let myColor : UIColor = UIColor.lightGray
        btnSkip.layer.borderColor = myColor.cgColor
        btnSkip.layer.borderWidth = 0.5
        btnSkip.clipsToBounds = true
        
    }
    
    @IBAction func pushBtnSignIn(_ sender: Any) {
        delegate?.signIn()
    }
    
    @IBAction func pushBtnSkip(_ sender: Any) {
        delegate?.skip()
    }
}
