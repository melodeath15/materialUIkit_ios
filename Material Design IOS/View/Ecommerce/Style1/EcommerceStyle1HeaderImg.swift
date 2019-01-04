//
//  EcommerceStyle1HeaderImg.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/2/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle1HeaderImgDelegate {
    func shopNow()
}

class EcommerceStyle1HeaderImg: UICollectionReusableView {
    
    var delegate: EcommerceStyle1HeaderImgDelegate?
    @IBOutlet var img: UIImageView!
    @IBOutlet var yearhCollection: UILabel!
    @IBOutlet var title: UILabel!
    @IBOutlet var btnShop: UIButton!

    @IBAction func pushBtnShop(_ sender: Any) {
        delegate?.shopNow()
    }
    
}
