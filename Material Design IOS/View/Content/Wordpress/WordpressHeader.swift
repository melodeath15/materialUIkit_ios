//
//  WordpressHeader.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 1/19/18.
//  Copyright © 2018 Mediatechindo. All rights reserved.
//

import UIKit

protocol WordpressHeaderDelegate {
    func pushHeader(index: IndexPath)
}

class WordpressHeader: UITableViewCell {
    
    var delegate: WordpressHeaderDelegate?
    @IBOutlet var img: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var subtitle: UILabel!
    @IBOutlet var BtnPush: UIButton!
    var index = IndexPath()
    
    @IBAction func pushCell(_ sender: Any) {
        delegate?.pushHeader(index: index)
    }
    
}
