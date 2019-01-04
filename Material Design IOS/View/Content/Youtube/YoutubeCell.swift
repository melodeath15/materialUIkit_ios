//
//  YoutubeCell.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 1/22/18.
//  Copyright © 2018 Mediatechindo. All rights reserved.
//

import UIKit

protocol YoutubeCellDelegate {
    func pushCell(index: IndexPath)
}

class YoutubeCell: UITableViewCell {
    
    var delegate: YoutubeCellDelegate?
    @IBOutlet var img: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var name: UILabel!
    @IBOutlet var timeDate: UILabel!
    var index = IndexPath()
    
    @IBAction func pushCell(_ sender: Any) {
        delegate?.pushCell(index: index)
    }
    
}
