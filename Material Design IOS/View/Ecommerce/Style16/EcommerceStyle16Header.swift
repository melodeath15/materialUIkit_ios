//
//  EcommerceStyle16Header.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/8/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceStyle16Header: UIView, CPSliderDelegate {
    
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
