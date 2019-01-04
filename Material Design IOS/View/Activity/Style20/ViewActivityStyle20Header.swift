//
//  ViewActivityStyle20Header.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/14/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ViewActivityStyle20HeaderDelegate {
    func PushLike()
}

class ViewActivityStyle20Header: UITableViewCell {
    
    var delegate: ViewActivityStyle20HeaderDelegate?
    @IBOutlet var imgPost: UIImageView!
    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var btnLike: UIButton!
    @IBOutlet var des: UILabel!
    @IBOutlet var valueLove: UILabel!
    @IBOutlet var valueComment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgProfile.layer.cornerRadius = imgProfile.frame.size.width/2
        imgProfile.clipsToBounds = true
        
    }
    
    @IBAction func pushBtnLike(_ sender: Any) {
        delegate?.PushLike()
    }
    
}
