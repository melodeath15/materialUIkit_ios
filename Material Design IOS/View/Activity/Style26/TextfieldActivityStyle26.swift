//
//  TextfieldActivityStyle26.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/16/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol TextfieldActivityStyle26Delegate {
    func textChange(text: String, tag: NSInteger)
    func Send()
    func attc()
}

class TextfieldActivityStyle26: UIView, UITextFieldDelegate {
    
    var delegate: TextfieldActivityStyle26Delegate?
    @IBOutlet var textFieldComment: UITextField!
    @IBOutlet var btnSend: UIButton!
    @IBOutlet var bdtnAttc: UIButton!
    
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

    @IBAction func pushAttc(_ sender: Any) {
        delegate?.attc()
    }
    
}
