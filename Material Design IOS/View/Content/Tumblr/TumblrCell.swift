//
//  TumblrCell.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 1/23/18.
//  Copyright © 2018 Mediatechindo. All rights reserved.
//

import UIKit

protocol TumblrCellDelegate {
    func pushCell(index: IndexPath)
}

class TumblrCell: UICollectionViewCell {
    
    var delegate: TumblrCellDelegate?
    @IBOutlet var img: UIImageView!
    @IBOutlet var btnCell: UIButton!
    var index = IndexPath()
    
    @IBAction func pushBtnCell(_ sender: Any) {
        delegate?.pushCell(index: index)
    }
}
