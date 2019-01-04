//
//  EcommerceStyle8HeaderCell.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/4/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle8HeaderCellDelegate {
    func shopNow(index: NSIndexPath)
}

class EcommerceStyle8HeaderCell: UICollectionReusableView {
    
    var delegate: EcommerceStyle8HeaderCellDelegate?
    @IBOutlet var titleCategory: UILabel!
    @IBOutlet var countImg: UILabel!
    @IBOutlet var img: UIImageView!
    @IBOutlet var catalog: UILabel!
    @IBOutlet var title: UILabel!
    @IBOutlet var btnShop: UIButton!
    var index = NSIndexPath()
    
    @IBAction func pushBtnShop(_ sender: Any) {
        delegate?.shopNow(index: index)
    }
}
