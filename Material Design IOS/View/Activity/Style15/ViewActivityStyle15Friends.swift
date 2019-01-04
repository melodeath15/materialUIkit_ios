//
//  ViewActivityStyle15Friends.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/9/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ViewActivityStyle15FriendsDelegate {
    func like(index: IndexPath)
}

class ViewActivityStyle15Friends: UITableViewCell {
    
    var delegate : ViewActivityStyle15FriendsDelegate?
    @IBOutlet var viewCell: UIView!
    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var btnLike: UIButton!
    @IBOutlet var viewColl: UIView!
    @IBOutlet var valueLove: UILabel!
    @IBOutlet var valueView: UILabel!
    var indexPathCell : IndexPath!

    @IBAction func pushLike(_ sender: Any) {
        delegate?.like(index: indexPathCell)
    }
    
}
