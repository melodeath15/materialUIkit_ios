//
//  EcommerceStyle9Cell.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/4/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle9CellDelegate {
    func shop(index: NSIndexPath)
    func love(index: NSIndexPath)
    func pushCell(index: NSIndexPath)
}

class EcommerceStyle9Cell: UITableViewCell {
    
    var delegate: EcommerceStyle9CellDelegate?
    @IBOutlet var img: UIImageView!
    @IBOutlet var btnShop: UIButton!
    @IBOutlet var btnLove: UIButton!
    @IBOutlet var title: UILabel!
    @IBOutlet var rating: AARatingBar!
    @IBOutlet var valueOld: UILabel!
    @IBOutlet var valueNew: UILabel!
    var index = NSIndexPath()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnShop.layer.cornerRadius = btnShop.frame.size.width/2
        btnShop.clipsToBounds = true
        
        btnLove.layer.cornerRadius = btnLove.frame.size.width/2
        btnLove.clipsToBounds = true
        
    }
    
    @IBAction func pushBtnBuy(_ sender: Any) {
        delegate?.shop(index: index)
    }
    
    @IBAction func pushBtnLove(_ sender: Any) {
        delegate?.love(index: index)
    }

    @IBAction func pushBtnCell(_ sender: Any) {
        delegate?.pushCell(index: index)
    }
}
