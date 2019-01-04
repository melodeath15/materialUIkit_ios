//
//  ViewActivityStyle3Text.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ViewActivityStyle3TextDelegate {
    func comments()
    func like()
}

class ViewActivityStyle3Text: UITableViewCell {
    
    var delegate: ViewActivityStyle3TextDelegate?
    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var note: UILabel!
    @IBOutlet var valueComments: UILabel!
    @IBOutlet var valueLike: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgProfile.layer.cornerRadius = imgProfile.frame.size.width/2
        imgProfile.clipsToBounds = true
        
    }
    
    @IBAction func pushComments(_ sender: Any) {
        delegate?.comments()
    }
    
    @IBAction func pushLike(_ sender: Any) {
        delegate?.like()
    }
}
