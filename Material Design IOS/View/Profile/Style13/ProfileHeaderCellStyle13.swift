//
//  ProfileHeaderCellStyle13.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 11/9/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ProfileHeaderCellStyle13Delegate {
    func photos()
    func stories()
    func friens()
}

class ProfileHeaderCellStyle13: UITableViewCell {
    
    var delegate: ProfileHeaderCellStyle13Delegate?
    @IBOutlet var img: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var ciy: UILabel!
    
    @IBOutlet var valuePhotos: UILabel!
    @IBOutlet var valueStories: UILabel!
    @IBOutlet var valueFriends: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
                
        img.layer.cornerRadius = img.frame.size.width/2
        img.clipsToBounds = true
        
    }
    
    @IBAction func PushPhotos(_ sender: Any) {
        delegate?.photos()
    }
    
    @IBAction func PushStories(_ sender: Any) {
        delegate?.stories()
    }
    
    @IBAction func PushFriends(_ sender: Any) {
        delegate?.friens()
    }
    
}
