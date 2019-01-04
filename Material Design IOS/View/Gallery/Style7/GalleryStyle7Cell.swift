//
//  GalleryStyle7Cell.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/24/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol GalleryStyle7CellDelegate {
    func pushcellSelect(count: Int)
}

class GalleryStyle7Cell: UICollectionViewCell {
    
    var delegate: GalleryStyle7CellDelegate?
    @IBOutlet var img: UIImageView!
    @IBOutlet var viewCentang: UIView!
    @IBOutlet var centangPutih: UIImageView!
    @IBOutlet var video: UIImageView!
    @IBOutlet var btnCell: UIButton!
    var count = Int()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewCentang.layer.cornerRadius = viewCentang.frame.size.width/2
        viewCentang.clipsToBounds = true
    }
    
    @IBAction func pushBtnCell(_ sender: Any) {
        if viewCentang.isHidden{
            viewCentang.isHidden = false
            img.alpha = 0.4
            count = 1
        }else{
            viewCentang.isHidden = true
            img.alpha = 1
            count = -1
        }
        delegate?.pushcellSelect(count: count)
    }
}
