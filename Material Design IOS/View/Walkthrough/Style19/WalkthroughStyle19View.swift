//
//  WalkthroughStyle19View.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class WalkthroughStyle19View: UIView {
    
    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    @IBOutlet var img: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var des: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let myColor : UIColor = UIColor.lightGray
        view1.layer.borderColor = myColor.cgColor
        view1.layer.borderWidth = 0.5
        view1.clipsToBounds = true
        
        view2.layer.borderColor = myColor.cgColor
        view2.layer.borderWidth = 0.5
        view2.clipsToBounds = true
        
    }
}
