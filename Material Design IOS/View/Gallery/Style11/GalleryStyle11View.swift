//
//  GalleryStyle11View.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/24/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol GalleryStyle11ViewDelegate {
    func share()
    func edit()
    func close()
}

class GalleryStyle11View: UIView {
    
    var delegate: GalleryStyle11ViewDelegate?
    
    @IBOutlet var img: UIImageView!
    @IBOutlet var btnShare: UIButton!
    @IBOutlet var btnEdit: UIButton!
    @IBOutlet var btnClose: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnEdit.layer.cornerRadius = btnEdit.frame.size.width/2
        btnEdit.clipsToBounds = true
        
    }
    
    @IBAction func pushBtnShare(_ sender: Any) {
        delegate?.share()
    }
    
    @IBAction func pushBtnEdit(_ sender: Any) {
        delegate?.edit()
    }
    
    @IBAction func pushBtnClose(_ sender: Any) {
        delegate?.close()
    }
}
