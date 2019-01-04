//
//  GalleryStyle6Cell.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/21/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol GalleryStyle6CellDelegate {
    func pushCell(count: Int)
    func pushShowAll()
}

class GalleryStyle6Cell: UICollectionViewCell {
    
    var delegate: GalleryStyle6CellDelegate?
    @IBOutlet var img: UIImageView!
    @IBOutlet var value: UILabel!
    @IBOutlet var label: UILabel!
    @IBOutlet var viewCentang: UIView!
    
    var index = NSIndexPath()
    var count = Int()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewCentang.layer.cornerRadius = viewCentang.frame.size.width/2
        viewCentang.clipsToBounds = true
        
    }
    
    @IBAction func pushBtnCell(_ sender: Any) {
        
        if index.row < 5{
            if viewCentang.isHidden {
                viewCentang.isHidden = false
                count = 1
            }else{
                viewCentang.isHidden = true
                count = -1
            }
            
            delegate?.pushCell(count: count)
        }else{
            delegate?.pushShowAll()
        }
    }
}
