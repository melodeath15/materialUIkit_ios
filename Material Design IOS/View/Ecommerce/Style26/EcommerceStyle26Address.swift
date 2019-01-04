//
//  EcommerceStyle26Address.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/11/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle26AddressDelegate {
    func editAddress()
    func editPayment()
}

class EcommerceStyle26Address: UITableViewCell {
    
    var delegate: EcommerceStyle26AddressDelegate?
    @IBOutlet var titleShippingAddress: UILabel!
    @IBOutlet var street: UILabel!
    @IBOutlet var titlePayment: UILabel!
    @IBOutlet var imgPayment: UIImageView!
    @IBOutlet var numberPayment: UILabel!
    
    @IBAction func pushEditAddress(_ sender: Any) {
        delegate?.editAddress()
    }
    
    @IBAction func pushEditPayment(_ sender: Any) {
        delegate?.editPayment()
    }
    
}
