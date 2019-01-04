//
//  TwitterHeader.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 1/25/18.
//  Copyright © 2018 Mediatechindo. All rights reserved.
//

import UIKit

protocol TwitterHeaderDelegate {
    func search()
}

class TwitterHeader: UIView {
    
    var delegate: TwitterHeaderDelegate?
    @IBOutlet var btnMenu: UIButton!
    @IBOutlet var title: UILabel!
    @IBOutlet var btnSearch: UIButton!
    
    @IBAction func pushBtnSearch(_ sender: Any) {
        delegate?.search()
    }
    
}
