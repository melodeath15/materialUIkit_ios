//
//  GalleryStyle4Cell.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/20/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol GalleryStyle4CellDelegate {
    func pushCell(index: NSIndexPath)
}

class GalleryStyle4Cell: UITableViewCell {
    
    var delegate: GalleryStyle4CellDelegate?
    @IBOutlet var img: UIImageView!
    @IBOutlet var iconLove: UIImageView!
    @IBOutlet var iconView: UIImageView!
    @IBOutlet var iconTime: UIImageView!
    @IBOutlet var valueLove: UILabel!
    @IBOutlet var valueView: UILabel!
    @IBOutlet var valueTime: UILabel!
    var index = NSIndexPath()
    
    @IBAction func pushBtnCell(_ sender: Any) {
        delegate?.pushCell(index: index)
    }

}
