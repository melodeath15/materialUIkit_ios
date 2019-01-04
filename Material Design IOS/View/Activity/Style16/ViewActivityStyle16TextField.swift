//
//  ViewActivityStyle16TextField.swift
//  Material Design IOS
//
//  Created by yanuar prisantoso on 6/12/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ViewActivityStyle16TextFieldDelegate {
    func textChange(text: String, tag: NSInteger)
    func Send()
}

class ViewActivityStyle16TextField: UIView, UITextFieldDelegate {
    
    var delegate: ViewActivityStyle16TextFieldDelegate?
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
