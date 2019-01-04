//
//  EcommerceStyle11CellHeader.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/4/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle11CellHeaderDelegate {
    func showAll(status: Bool)
}

class EcommerceStyle11CellHeader: UITableViewCell {
    
    var delegate: EcommerceStyle11CellHeaderDelegate?
    @IBOutlet var title: UILabel!
    @IBOutlet var price: UILabel!
    @IBOutlet var titleDes: UILabel!
    @IBOutlet var btnShow: UIButton!
    @IBOutlet var valueDes: UILabel!
    var status = Bool()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        status = true
    }
    
    @IBAction func pushBtnShow(_ sender: Any) {
        if status {
            status = false
            btnShow.setImage(UIImage(named: "dropupIcon"), for: .normal)
        }else{
            status = true
            btnShow.setImage(UIImage(named: "dropdownIcon"), for: .normal)
        }
        
        delegate?.showAll(status: status)
    }
}
