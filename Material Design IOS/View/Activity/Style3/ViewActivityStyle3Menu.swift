//
//  ViewActivityStyle3Menu.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ViewActivityStyle3MenuDelegate {
    func feed()
    func popular()
    func media()
}

class ViewActivityStyle3Menu: UIView {
    
    var delegate : ViewActivityStyle3MenuDelegate?
    @IBOutlet var feed: UIButton!
    @IBOutlet var popular: UIButton!
    @IBOutlet var media: UIButton!
    @IBOutlet var viewFeed: UIView!
    @IBOutlet var viewPopular: UIView!
    @IBOutlet var viewMedia: UIView!
    
    @IBAction func pushFeed(_ sender: Any) {
        viewFeed.isHidden = false
        viewPopular.isHidden = true
        viewMedia.isHidden = true
        
        feed.setTitleColor(UIColor.white, for: .normal)
        popular.setTitleColor(UIColor.lightText, for: .normal)
        media.setTitleColor(UIColor.lightText, for: .normal)
        
        delegate?.feed()
    }
    
    @IBAction func pushPopular(_ sender: Any) {
        viewFeed.isHidden = true
        viewPopular.isHidden = false
        viewMedia.isHidden = true
        
        feed.setTitleColor(UIColor.lightText, for: .normal)
        popular.setTitleColor(UIColor.white, for: .normal)
        media.setTitleColor(UIColor.lightText, for: .normal)
        
        delegate?.popular()
    }
    
    @IBAction func pushMedia(_ sender: Any) {
        viewFeed.isHidden = true
        viewPopular.isHidden = true
        viewMedia.isHidden = false
        
        feed.setTitleColor(UIColor.lightText, for: .normal)
        popular.setTitleColor(UIColor.lightText, for: .normal)
        media.setTitleColor(UIColor.white, for: .normal)

        delegate?.media()
    }
    
    
}
