//
//  GalleryStyle19Cell.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/25/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol GalleryStyle19CellDelegate {
    func pushCell(count: Int)
}

class GalleryStyle19Cell: UICollectionViewCell {
    
    var delegate: GalleryStyle19CellDelegate?
    @IBOutlet var img: UIImageView!
    @IBOutlet var btnCell: UIButton!
    @IBOutlet var viewCentang: UIView!
    @IBOutlet var imgCentang: UIImageView!
    @IBOutlet var frameImg: UIImageView!
    @IBOutlet var imgAlfa: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewCentang.layer.cornerRadius = viewCentang.layer.frame.size.width/2
        viewCentang.clipsToBounds = true
        
    }
    
    @IBAction func pushBtnCell(_ sender: Any) {
        
        var count = 0
        
        if viewCentang.isHidden {
            viewCentang.isHidden = false
            frameImg.isHidden = false
            imgAlfa.isHidden = false
            count = 1
        }else{
            viewCentang.isHidden = true
            frameImg.isHidden = true
            imgAlfa.isHidden = true
            img.alpha = 1
            count = -1
        }
    
        delegate?.pushCell(count: count)
    }

}
