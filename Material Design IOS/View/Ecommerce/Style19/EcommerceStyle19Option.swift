//
//  EcommerceStyle19Option.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/9/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle19OptionDelegate {
    func color()
    func qty()
}

class EcommerceStyle19Option: UIView {
    
    var delegate: EcommerceStyle19OptionDelegate?
    
    @IBOutlet var valueColor: UIView!
    @IBOutlet var btnColor: UIButton!
    @IBOutlet var btnQty: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        valueColor.layer.cornerRadius = 5
        valueColor.clipsToBounds = true
        
    }
    
    @IBAction func pushBtnColor(_ sender: Any) {
        delegate?.color()
    }
    
    @IBAction func pushBtnQty(_ sender: Any) {
        delegate?.qty()
    }

}
