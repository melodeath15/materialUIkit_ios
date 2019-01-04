//
//  EcommerceStyle12Header.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceStyle12Header: UITableViewCell, CPSliderDelegate {
    
    @IBOutlet var slider: CPImageSlider!
    var imagesArray = [String]()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        slider.delegate = self
    }
    
    func sliderImageTapped(slider: CPImageSlider, index: Int) {
        // not use
    }
    
    func sliderGetIndex(index: Int) {
        // not use
    }
    
}
