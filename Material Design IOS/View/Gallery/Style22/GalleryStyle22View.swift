//
//  GalleryStyle22View.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/25/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol GalleryStyle22ViewDelegate {
    func tapImgae(slider: CPImageSlider, index: Int)
    func targetIndex(index: Int)
}

class GalleryStyle22View: UIView, CPSliderDelegate {
    
    var delegate: GalleryStyle22ViewDelegate?

    @IBOutlet var slider: CPImageSlider!
    @IBOutlet var viewDes: UIView!
    @IBOutlet var title: UILabel!
    @IBOutlet var tagLabel: UILabel!
    @IBOutlet var rating: AARatingBar!
    @IBOutlet var des: UILabel!

    var imagesArray = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        slider.delegate = self
    }
    
    func sliderImageTapped(slider: CPImageSlider, index: Int) {
        delegate?.tapImgae(slider: slider, index: index)
    }
    
    func sliderGetIndex(index: Int) {
        delegate?.targetIndex(index: index)
    }

    
}
