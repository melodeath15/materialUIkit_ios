//
//  GalleryStyle18Cell.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/25/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol GalleryStyle18CellDelegate {
    func pushCell(count: Int)
}

class GalleryStyle18Cell: UITableViewCell {
    
    var delegate: GalleryStyle18CellDelegate?
    
    @IBOutlet var img: UIImageView!
    @IBOutlet var btnCell: UIButton!
    @IBOutlet var viewCentang: UIView!
    @IBOutlet var imgCentang: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewCentang.layer.cornerRadius = viewCentang.frame.size.width/2
        viewCentang.clipsToBounds = true
        
    }
    
    @IBAction func pushBtnCell(_ sender: Any) {
        
        var count = 0
        
        if viewCentang.isHidden {
            viewCentang.isHidden = false
            count = 1
        }else{
            viewCentang.isHidden = true
            count = -1
        }
        
        delegate?.pushCell(count: count)
    }
    
}
