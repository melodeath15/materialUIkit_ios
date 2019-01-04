//
//  ViewActivityStyle8.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/8/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ViewActivityStyle8Delegate {
    func showlove(index: IndexPath)
    func showview(index: IndexPath)
}

class ViewActivityStyle8: UITableViewCell {
    
    var delegate: ViewActivityStyle8Delegate?
    @IBOutlet var bgCell: UIImageView!
    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var time: UILabel!
    
    @IBOutlet var btnLove: UIButton!
    @IBOutlet var btnView: UIButton!
    var indxPath: IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgProfile.layer.cornerRadius = imgProfile.frame.size.width/2
        imgProfile.clipsToBounds = true
        
        btnLove.layer.cornerRadius = btnLove.frame.size.width/2
        btnLove.clipsToBounds = true
        
        btnView.layer.cornerRadius = btnView.frame.size.width/2
        btnView.clipsToBounds = true
        
    }
    
    @IBAction func pushView(_ sender: Any) {
        delegate?.showview(index: indxPath)
    }
    
    @IBAction func pushLove(_ sender: Any) {
        delegate?.showlove(index: indxPath)
    }
}
