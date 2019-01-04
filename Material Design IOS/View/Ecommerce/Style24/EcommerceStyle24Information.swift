//
//  EcommerceStyle24Information.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/10/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle24InformationDelegate {
    func getTextfield(tag: Int, text: String)
}

class EcommerceStyle24Information: UITableViewCell, UITextFieldDelegate {
    
    var delegate: EcommerceStyle24InformationDelegate?
    @IBOutlet var title: UILabel!
    @IBOutlet var first: UITextField!
    @IBOutlet var last: UITextField!
    @IBOutlet var add1: UITextField!
    @IBOutlet var add2: UITextField!
    @IBOutlet var city: UITextField!
    @IBOutlet var zipCode: UITextField!
    @IBOutlet var state: UITextField!
    @IBOutlet var country: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        first.delegate = self
        first.tag = 1
        
        last.delegate = self
        last.tag = 2
        
        add1.delegate = self
        add1.tag = 3
        
        add2.delegate = self
        add2.tag = 4
        
        city.delegate = self
        city.tag = 5
        
        zipCode.delegate = self
        zipCode.tag = 6
        
        state.delegate = self
        state.tag = 7

        country.delegate = self
        country.tag = 8
        
        first.addTarget(self, action: #selector(textfieldDidChange(_:)), for: .editingChanged)
        last.addTarget(self, action: #selector(textfieldDidChange(_:)), for: .editingChanged)
        add1.addTarget(self, action: #selector(textfieldDidChange(_:)), for: .editingChanged)
        add2.addTarget(self, action: #selector(textfieldDidChange(_:)), for: .editingChanged)
        city.addTarget(self, action: #selector(textfieldDidChange(_:)), for: .editingChanged)
        zipCode.addTarget(self, action: #selector(textfieldDidChange(_:)), for: .editingChanged)

    }
    
    func textfieldDidChange(_ textField: UITextField) {
        delegate?.getTextfield(tag: textField.tag, text: textField.text!)
    }
    
}
