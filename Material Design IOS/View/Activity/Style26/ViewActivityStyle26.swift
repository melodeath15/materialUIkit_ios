//
//  ViewActivityStyle26.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/16/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ViewActivityStyle26Delegate {
    func MenuOrBack()
    func Option()
}

class ViewActivityStyle26: UIView {

    var delegate: ViewActivityStyle26Delegate?
    @IBOutlet var iconBack: UIButton!
    @IBOutlet var titleHeader: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet var btnOption: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgProfile.layer.cornerRadius = imgProfile.frame.size.width/2
        imgProfile.clipsToBounds = true
        
    }
    
    @IBAction func back(_ sender: Any) {
        delegate?.MenuOrBack()
    }
    
    @IBAction func option(_ sender: Any) {
        delegate?.Option()
    }
}
