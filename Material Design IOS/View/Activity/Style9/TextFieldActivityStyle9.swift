//
//  TextFieldActivityStyle9.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada  on 6/8/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol TextFieldActivityStyle9Delegate {
    func textChange(text: String, tag: NSInteger)
    func Send()
}

class TextFieldActivityStyle9: UIView, UITextFieldDelegate {
    
    var delegate: TextFieldActivityStyle9Delegate?
    @IBOutlet var textFieldComment: UITextField!
    @IBOutlet var btnSend: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        textFieldComment.delegate = self
        textFieldComment.tag = 0
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.textChange(text: textField.text!, tag: textField.tag)
    }
    
    
    @IBAction func pushSend(_ sender: Any) {
        delegate?.Send()
    }
    
}
