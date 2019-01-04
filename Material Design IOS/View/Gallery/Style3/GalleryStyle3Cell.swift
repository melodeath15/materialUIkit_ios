//
//  GalleryStyle3Cell.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/20/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol GalleryStyle3CellDelegate {
    func pushOptionColl(index: NSIndexPath)
    func pushCell(index: NSIndexPath)
}

class GalleryStyle3Cell: UICollectionViewCell {
    
    var delegate: GalleryStyle3CellDelegate?
    @IBOutlet var title: UILabel!
    @IBOutlet var img: UIImageView!
    @IBOutlet var btnOption: UIButton!
    var index = NSIndexPath()
    
    @IBAction func pushBtnOption(_ sender: Any) {
        delegate?.pushOptionColl(index: index)
    }
    
    @IBAction func pushBtnCell(_ sender: Any) {
        delegate?.pushCell(index: index)
    }
    
}
