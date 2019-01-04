//
//  YoutubeHeader.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 1/22/18.
//  Copyright © 2018 Mediatechindo. All rights reserved.
//

import UIKit

protocol YoutubeHeaderDelegate {
    func pushHeader(index: IndexPath)
}

class YoutubeHeader: UITableViewCell {
    
    var delegate: YoutubeHeaderDelegate?
    @IBOutlet var img: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var timeDate: UILabel!
    @IBOutlet var name: UILabel!
    var index = IndexPath()
    
    @IBAction func pushCell(_ sender: Any) {
        delegate?.pushHeader(index: index)
    }
    
}
