//
//  ViewActivityStyle16Image.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/12/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ViewActivityStyle16ImageDelegate {
    func like()
}

class ViewActivityStyle16Image: UITableViewCell {
    
    var delegate: ViewActivityStyle16ImageDelegate?
    @IBOutlet var viewCell: UIView!
    @IBOutlet var profileImg: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var btnLike: UIButton!
    @IBOutlet var viewBgImg: UIView!
    @IBOutlet var imgFoto: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var posted: UILabel!
    @IBOutlet var des: UILabel!
    @IBOutlet var valueLove: UILabel!
    @IBOutlet var valueView: UILabel!
    var indexPathCell : IndexPath!
    
    @IBAction func pushLike(_ sender: Any) {
        delegate?.like()
    }
    
}
