//
//  HeaderDetail.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/23/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol HeaderDetailDelegate {
    func back()
}

class HeaderDetail: UIView {
    
    var delegate: HeaderDetailDelegate?
    @IBOutlet var title: UILabel!

    @IBAction func pushBack(_ sender: Any) {
        delegate?.back()
    }
    
    
}
