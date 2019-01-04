//
//  ProfileCellMenuStyle30.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 11/15/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ProfileCellMenuStyle30Delegate {
    func push(index:IndexPath)
}

class ProfileCellMenuStyle30: UICollectionViewCell {
    
    var delegate: ProfileCellMenuStyle30Delegate?
    @IBOutlet var btnCell: UIButton!
    @IBOutlet var value: UILabel!
    @IBOutlet var label: UILabel!
    @IBOutlet var view: UIView!
    
    var index = IndexPath()
    
    @IBAction func push(_ sender: Any) {
        delegate?.push(index: index)
    }
    
}
