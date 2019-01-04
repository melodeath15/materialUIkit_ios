//
//  MenuStyle15Footer.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/17/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol MenuStyle15FooterDelegate {
    func setting()
    func profile()
    func logout()
}

class MenuStyle15Footer: UIView {
    
    var delegate: MenuStyle15FooterDelegate?
    @IBOutlet var btnSetting: UIButton!
    @IBOutlet var btnProflile: UIButton!
    @IBOutlet var btnLogout: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnProflile.layer.cornerRadius = btnProflile.frame.size.width/2
        btnProflile.clipsToBounds = true
        
    }
    
    @IBAction func pushBtnSetting(_ sender: Any) {
        delegate?.setting()
    }
    
    @IBAction func pushBtnProfile(_ sender: Any) {
        delegate?.profile()
    }
    
    @IBAction func pushBtnLogout(_ sender: Any) {
        delegate?.logout()
    }
    
}
