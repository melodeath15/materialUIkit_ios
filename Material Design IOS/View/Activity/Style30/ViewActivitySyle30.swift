//
//  ViewActivitySyle30.swift
//  Material Design IOS
//
//  Created by yanuar prisantoso on 6/19/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ViewActivitySyle30Delegate {
    func btnPlay(index: NSIndexPath, btn: UIButton, slider: UISlider, label: UILabel)
    func statusChange(status: UISlider, label: UILabel)
    func btnTimer()
}

class ViewActivitySyle30: UITableViewCell {
    
    var delegate: ViewActivitySyle30Delegate?
    
    @IBOutlet var viewC: UIView!
    @IBOutlet var viewPlay: UIView!
    @IBOutlet var btnPlay: UIButton!
    @IBOutlet var sliderStatus: UISlider!
    @IBOutlet var timePlay: UILabel!
    @IBOutlet var timePost: UILabel!
    var index = NSIndexPath()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewC.transform = viewC.transform.rotated(by: CGFloat(40.0))
        viewPlay.layer.cornerRadius = 2
        viewPlay.clipsToBounds = true
        
    }
        
    @IBAction func statusChange(_ sender: Any) {
        delegate?.statusChange(status: sliderStatus, label: timePlay)
    }
    
    @IBAction func pushBtnPlay(_ sender: Any) {
        delegate?.btnPlay(index: index, btn: btnPlay, slider: sliderStatus, label: timePlay)
    }

}
