//
//  InstagramCell.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 1/23/18.
//  Copyright © 2018 Mediatechindo. All rights reserved.
//

import UIKit

protocol InstagramCellDelegate {
    func commentCell(index: IndexPath)
    func shareCell(index: IndexPath)
    func openCell(index: IndexPath)
}

class InstagramCell: UITableViewCell {
    
    var delegate: InstagramCellDelegate?
    @IBOutlet var profile: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var timeDate: UILabel!
    @IBOutlet var valueLove: UILabel!
    @IBOutlet var deskription: UILabel!
    @IBOutlet var hastax: UILabel!
    @IBOutlet var img: UIImageView!
    
    @IBOutlet var btnOpen: UIButton!
    @IBOutlet var btnShare: UIButton!
    @IBOutlet var btnComment: UIButton!
    
    var index = IndexPath()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profile.layer.cornerRadius = profile.layer.frame.size.width/2
        profile.clipsToBounds = true
        
    }
    
    @IBAction func pushOpen(_ sender: Any) {
        delegate?.openCell(index: index)
    }
    
    @IBAction func pushShare(_ sender: Any) {
        delegate?.shareCell(index: index)
    }
    
    @IBAction func pushComment(_ sender: Any) {
        delegate?.commentCell(index: index)
    }
    
}
