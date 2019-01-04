//
//  GalleryStyle23Cell.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/25/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol GalleryStyle23CellDelegate {
    func share(index: NSIndexPath)
}

class GalleryStyle23Cell: UICollectionViewCell {
    
    var delegate: GalleryStyle23CellDelegate?
    @IBOutlet var img: UIImageView!
    @IBOutlet var btnShare: UIButton!
    @IBOutlet var title: UILabel!
    @IBOutlet var tagLabel: UILabel!
    @IBOutlet var rating: AARatingBar!
    var index = NSIndexPath()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnShare.layer.cornerRadius = btnShare.frame.size.width/2
        btnShare.clipsToBounds = true
        
    }
    
    @IBAction func pushBtnShare(_ sender: Any) {
        delegate?.share(index: index)
    }
    
}
