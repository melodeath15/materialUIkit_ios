//
//  FacebookCell.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 1/29/18.
//  Copyright © 2018 Mediatechindo. All rights reserved.
//

import UIKit

protocol FacebookCellDelegate {
    func comment(index: IndexPath)
    func share(index: IndexPath)
    func open(index: IndexPath)
    func love(index: IndexPath)
}

class FacebookCell: UITableViewCell {
    
    var delegate: FacebookCellDelegate?
    @IBOutlet var profile: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var dateTime: UILabel!
    @IBOutlet var textPost: UILabel!
    @IBOutlet var imgPost: UIImageView!
    @IBOutlet var btnComment: UIButton!
    @IBOutlet var btnLove: UIButton!
    var index = IndexPath()
    
    @IBAction func pushCommetn(_ sender: Any) {
        delegate?.comment(index: index)
    }
    
    @IBAction func pushShare(_ sender: Any) {
        delegate?.share(index: index)
    }
    
    @IBAction func pushOpen(_ sender: Any) {
        delegate?.open(index: index)
    }
    
    @IBAction func pushLove(_ sender: Any) {
        delegate?.love(index: index)
    }

}
