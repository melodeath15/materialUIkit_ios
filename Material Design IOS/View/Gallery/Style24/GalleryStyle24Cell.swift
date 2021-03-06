//
//  GalleryStyle24Cell.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/25/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol GalleryStyle24CellDelegate {
    func shareImg(index: NSIndexPath)
}

class GalleryStyle24Cell: UITableViewCell {
    
    var delegate: GalleryStyle24CellDelegate?
    @IBOutlet var img: UIImageView!
    @IBOutlet var btnShare: UIButton!
    @IBOutlet var title: UILabel!
    @IBOutlet var count: UILabel!
    var index = NSIndexPath()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnShare.layer.cornerRadius = btnShare.frame.size.width/2
        btnShare.clipsToBounds = true
        
    }
    
    @IBAction func pushBtnShare(_ sender: Any) {
        delegate?.shareImg(index: index)
    }
    
}
