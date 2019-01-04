//
//  EcommerceStyle26Img.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/11/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle26ImgDelegate {
    func pushCellOrder(index: IndexPath)
}

class EcommerceStyle26Img: UITableViewCell {
    
    var delegate: EcommerceStyle26ImgDelegate?
    @IBOutlet var img: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var size: UILabel!
    @IBOutlet var qty: UILabel!
    @IBOutlet var price: UILabel!
    var index = IndexPath()
    
    @IBAction func pushBtnCellOrder(_ sender: Any) {
        delegate?.pushCellOrder(index: index)
    }
    
}
