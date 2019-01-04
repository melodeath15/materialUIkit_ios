//
//  WordpressCell.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 1/19/18.
//  Copyright © 2018 Mediatechindo. All rights reserved.
//

import UIKit

protocol WordpressCellDelegate {
    func pushCell(index: IndexPath)
}

class WordpressCell: UITableViewCell {
    
    var delegate: WordpressCellDelegate?
    @IBOutlet var viewcell: UIView!
    @IBOutlet var img: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var subtitle: UILabel!
    @IBOutlet var date: UILabel!
    var index = IndexPath()
    
    @IBAction func pushBtnCell(_ sender: Any) {
        delegate?.pushCell(index: index)
    }
    
}
