//
//  ViewActivityStyle17Menu.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/12/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ViewActivityStyle17MenuDelegate {
    func Feed()
    func Notif()
}

class ViewActivityStyle17Menu: UIView {
    
    var delegate : ViewActivityStyle17MenuDelegate?
    
    @IBOutlet var btnFeed: UIButton!
    @IBOutlet var btnNotif: UIButton!
    @IBOutlet var viewButton: UIView!
    @IBOutlet var viewButton2: UIView!
    
    @IBAction func pushFeed(_ sender: Any) {
        btnFeed.setTitleColor(UIColor.white, for: .normal)
        btnNotif.setTitleColor(UIColor.lightText, for: .normal)
        viewButton.isHidden = false
        viewButton2.isHidden = true
        delegate?.Feed()
    }
    
    @IBAction func pushNotif(_ sender: Any) {
        btnFeed.setTitleColor(UIColor.lightText, for: .normal)
        btnNotif.setTitleColor(UIColor.white, for: .normal)
        viewButton.isHidden = true
        viewButton2.isHidden = false
        delegate?.Notif()
    }
    
    
}
