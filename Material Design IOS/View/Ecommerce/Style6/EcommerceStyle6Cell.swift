//
//  EcommerceStyle6Cell.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/3/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceStyle6Cell: UICollectionViewCell {
    
    @IBOutlet var title: UILabel!
    @IBOutlet var img: UIImageView!
    @IBOutlet var value: UILabel!
    @IBOutlet var viewValue: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewValue.layer.cornerRadius = 5
        viewValue.clipsToBounds = true
        
    }
    
}
