//
//  ChatActivityStyle26Right.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/16/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ChatActivityStyle26Right: UITableViewCell {
    
    @IBOutlet var rect: UIView!
    @IBOutlet var bgMessage: UIView!
    @IBOutlet var valueMessage: UILabel!
    @IBOutlet var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        rect.transform = rect.transform.rotated(by: CGFloat(40.0))
        bgMessage.layer.cornerRadius = 2
        bgMessage.clipsToBounds = true
        
    }
    
}
