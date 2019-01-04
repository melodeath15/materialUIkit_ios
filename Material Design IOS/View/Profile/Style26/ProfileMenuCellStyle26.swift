//
//  ProfileMenuCellStyle26.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 11/14/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ProfileMenuCellStyle26Delegate {
    func pushBtn(index: IndexPath)
}

class ProfileMenuCellStyle26: UICollectionViewCell {
    
    var delegate: ProfileMenuCellStyle26Delegate?
    @IBOutlet var btnMenu: UIButton!
    @IBOutlet var name: UILabel!
    var index = IndexPath()
    
    @IBAction func push(_ sender: Any) {
        delegate?.pushBtn(index: index)
    }
    
}
