//
//  EcommerceStyle20Price.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/9/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle20PriceDelegate {
    func handleSlider(min: Float, max: Float, index: NSIndexPath)
}

class EcommerceStyle20Price: UITableViewCell {
    
    var delegate: EcommerceStyle20PriceDelegate?
    @IBOutlet var title: UILabel!
    @IBOutlet var viewCell: UIView!
    @IBOutlet var slider: MultiStepRangeSlider!
    @IBOutlet var minimumLabel: UILabel!
    @IBOutlet var maxmimumLabel: UILabel!
    var index = NSIndexPath()
    
    @IBAction func handleSliderChange(_ sender: AnyObject) {
        delegate?.handleSlider(min: slider.continuousCurrentValue.lower, max: slider.continuousCurrentValue.upper, index: index)
    }
    
}
