//
//  EcommerceStyle20CellCekBox.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/9/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle20CellCekBoxDelegate {
    func cekboxSelect(index: Int, checkState: M13Checkbox)
}

class EcommerceStyle20CellCekBox: UICollectionViewCell {
   
    var delegate: EcommerceStyle20CellCekBoxDelegate?
    @IBOutlet var cekbox: M13Checkbox!
    @IBOutlet var title: UILabel!
    var index = Int()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cekbox.boxType = .square
        
    }
    
    @IBAction func pushCekbox(_ sender: Any) {
        delegate?.cekboxSelect(index: index, checkState: cekbox)
    }

}
