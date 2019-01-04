//
//  ViewActivityStyle1NewFriends.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ViewActivityStyle1NewFriends: UITableViewCell {
    
    @IBOutlet var pointView: UIView!
    @IBOutlet var point2View: UIView!
    @IBOutlet var viewCell: UIView!
    @IBOutlet var name: UILabel!
    @IBOutlet var iconLove: UIImageView!
    @IBOutlet var valueLove: UILabel!
    @IBOutlet var iconView: UIImageView!
    @IBOutlet var valueView: UILabel!
    @IBOutlet var iconTime: UIImageView!
    @IBOutlet var valueTime: UILabel!
    @IBOutlet var viewColl: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        pointView.layer.cornerRadius = pointView.frame.size.width/2
        pointView.clipsToBounds = true
        
        viewCell.layer.cornerRadius = 4
        viewCell.clipsToBounds = true
        
    }

}
