//
//  TwitterCell.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 1/25/18.
//  Copyright © 2018 Mediatechindo. All rights reserved.
//

import UIKit

protocol TwitterCellDelegate {
    func retweet(index: IndexPath)
    func share(index: IndexPath)
    func open(index: IndexPath)
}

class TwitterCell: UITableViewCell {
    
    var delegate: TwitterCellDelegate?
    @IBOutlet var img: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var nameScreen: UILabel!
    @IBOutlet var datePost: UILabel!
    @IBOutlet var textTweet: UILabel!
    @IBOutlet var valueRetweet: UILabel!
    var index = IndexPath()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        img.layer.cornerRadius = img.frame.size.width/2
        img.clipsToBounds = true
        
    }
    
    @IBAction func pushRetweet(_ sender: Any) {
        delegate?.retweet(index: index)
    }
    
    @IBAction func pushShare(_ sender: Any) {
        delegate?.share(index: index)
    }
    
    @IBAction func pushOpen(_ sender: Any) {
        delegate?.open(index: index)
    }
    
}
