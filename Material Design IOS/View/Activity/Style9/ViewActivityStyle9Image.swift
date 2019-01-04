//
//  ViewActivityStyle9Image.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/8/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ViewActivityStyle9ImageDelegate {
    func Like(index: IndexPath)
}

class ViewActivityStyle9Image: UITableViewCell {
    
    var delegate: ViewActivityStyle9ImageDelegate?
    @IBOutlet var profileImg: UIImageView!
    @IBOutlet var imgPoster: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var valueLove: UILabel!
    var indxPath: IndexPath!
    
    @IBAction func pushLike(_ sender: Any) {
        delegate?.Like(index: indxPath)
    }
}
