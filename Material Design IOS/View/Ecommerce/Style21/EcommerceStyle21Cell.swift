//
//  EcommerceStyle21Cell.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/10/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle21CellDelegate {
    func plus(index: IndexPath)
    func minus(index: IndexPath)
}

class EcommerceStyle21Cell: UITableViewCell {
    
    var delegate: EcommerceStyle21CellDelegate?
    @IBOutlet var img: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var size: UILabel!
    @IBOutlet var btnMinus: UIButton!
    @IBOutlet var btnPlus: UIButton!
    @IBOutlet var valueCount: UILabel!
    @IBOutlet var price: UILabel!
    var index = IndexPath()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnMinus.layer.cornerRadius = btnMinus.frame.size.width/2
        btnMinus.clipsToBounds = true
        
        btnPlus.layer.cornerRadius = btnPlus.frame.size.width/2
        btnPlus.clipsToBounds = true
        
    }
    
    @IBAction func pushBtnMinus(_ sender: Any) {
        delegate?.minus(index: index)
    }
    
    @IBAction func pushBtnPlus(_ sender: Any) {
        delegate?.plus(index: index)
    }

}
