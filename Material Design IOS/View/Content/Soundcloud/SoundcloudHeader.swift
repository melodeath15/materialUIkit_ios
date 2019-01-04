//
//  SoundcloudHeader.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 1/24/18.
//  Copyright © 2018 Mediatechindo. All rights reserved.
//

import UIKit

protocol SoundcloudHeaderDelegate {
    func back()
    func share()
    func love()
}

class SoundcloudHeader: UIView {
    
    var delegate: SoundcloudHeaderDelegate?
    
    @IBAction func btnBack(_ sender: Any) {
        delegate?.back()
    }
    
    @IBAction func btnShare(_ sender: Any) {
        delegate?.share()
    }
    
    @IBAction func btnLove(_ sender: Any) {
        delegate?.love()
    }
    
}
