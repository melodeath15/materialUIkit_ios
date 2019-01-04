//
//  EcommerceStyle28View.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/11/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle28ViewDelegate {
    func useCode(code: String)
}

class EcommerceStyle28View: UIView {
    
    var delegate: EcommerceStyle28ViewDelegate?
    
    @IBOutlet var title: UILabel!
    @IBOutlet var des: UILabel!
    @IBOutlet var label1: UILabel!
    @IBOutlet var code: UILabel!
    
    @IBAction func pushBtnUseCode(_ sender: Any) {
        delegate?.useCode(code: code.text!)
    }
    
    
}
