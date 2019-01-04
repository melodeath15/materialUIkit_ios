//
//  GalleryLeftMenu.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/20/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol GalleryLeftMenuDelegate {
    func backVC()
}

class GalleryLeftMenu: UIView {
    
    var delegate: GalleryLeftMenuDelegate?
    
    @IBOutlet var iconBack: UIImageView!
    @IBOutlet var titleBack: UILabel!
    @IBOutlet var btnBack: UIButton!
    
    @IBAction func pushBtnBack(_ sender: Any) {
        delegate?.backVC()
    }
}
