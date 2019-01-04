//
//  EcommerceStyle20Cell.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/9/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle20CellDelegate {
    func pushCellIndex(index: Int)
}

class EcommerceStyle20Cell: UICollectionViewCell {
    
    var delegate: EcommerceStyle20CellDelegate?
    @IBOutlet var centang: UIButton!
    @IBOutlet var viewColor: UIButton!
    var index = Int()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        centang.layer.cornerRadius = 5
        centang.clipsToBounds = true
        
        viewColor.layer.cornerRadius = 5
        viewColor.clipsToBounds = true
    }
    
    @IBAction func pushCell(_ sender: Any) {
        
        if centang.isHidden {
            centang.isHidden = false
            delegate?.pushCellIndex(index: index)
        }else{
            centang.isHidden = true
        }
    }
}
