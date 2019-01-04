//
//  ViewStyle23.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/1/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ViewStyle23Delegate {
    func textChange(text: String, tag: NSInteger)
    func resetPassword()
}

class ViewStyle23: UIView, UITextFieldDelegate {
    
    var delegate: ViewStyle23Delegate?
    @IBOutlet var title: UILabel!
    @IBOutlet var des: UILabel!
    @IBOutlet var email: UITextField!
    @IBOutlet var btnReset: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        email.delegate = self
        email.tag = 0
        
    }
        
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.textChange(text: textField.text!, tag: textField.tag)
    }
    
    @IBAction func pushReset(_ sender: Any) {
        delegate?.resetPassword()
    }
    
    
}
