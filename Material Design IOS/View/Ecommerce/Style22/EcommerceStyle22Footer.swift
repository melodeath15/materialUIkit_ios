//
//  EcommerceStyle22Footer.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/10/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle22FooterDelegate {
    func promo(code: String)
    func checkout()
}

class EcommerceStyle22Footer: UIView, UITextFieldDelegate {
    
    var delegate: EcommerceStyle22FooterDelegate?
    @IBOutlet var codePromo: UITextField!
    @IBOutlet var btnPromo: UIButton!
    @IBOutlet var labelSubtotal: UILabel!
    @IBOutlet var labelTotal: UILabel!
    @IBOutlet var valueSubtotal: UILabel!
    @IBOutlet var valueTotal: UILabel!
    @IBOutlet var btnCheckout: UIButton!
    var code = String()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnPromo.layer.cornerRadius = btnPromo.frame.size.width/2
        btnPromo.clipsToBounds = true
        
        codePromo.delegate = self
        
        codePromo.addTarget(self, action: #selector(textfieldDidChange(_:)), for: .editingChanged)
        
    }
    
    func textfieldDidChange(_ textField: UITextField) {
        print(textField.text!)
        
        if (textField.text?.characters.count)! > 0{
            btnPromo.isHidden = false
        }else{
            btnPromo.isHidden = true
        }
        code = textField.text!
    }
    
    @IBAction func pusBtnCode(_ sender: Any) {
        delegate?.promo(code: code)
    }
    
    @IBAction func pushBtnCheckout(_ sender: Any) {
        delegate?.checkout()
    }
    
    
}
