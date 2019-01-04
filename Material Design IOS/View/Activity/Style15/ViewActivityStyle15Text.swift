//
//  ViewActivityStyle15Text.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/9/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ViewActivityStyle15TextDelegate {
    func like(index: IndexPath)
}

class ViewActivityStyle15Text: UITableViewCell {
    
    var delegate: ViewActivityStyle15TextDelegate?
    @IBOutlet var viewCell: UIView!
    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var btnLike: UIButton!
    @IBOutlet var titile: UILabel!
    @IBOutlet var des: UILabel!
    @IBOutlet var valueLove: UILabel!
    @IBOutlet var valueView: UILabel!
    var indexPathCell : IndexPath!
    
    @IBAction func pushLike(_ sender: Any) {
        delegate?.like(index: indexPathCell)
    }
        
}
