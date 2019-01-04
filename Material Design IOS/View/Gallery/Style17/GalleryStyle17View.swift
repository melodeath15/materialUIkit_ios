//
//  GalleryStyle17View.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/25/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol GalleryStyle17ViewViewDelegate {
    func tapImgae(slider: CPImageSlider, index: Int)
    func targetIndex(index: Int)
}

class GalleryStyle17View: UIView, CPSliderDelegate {
    
    var delegate: GalleryStyle17ViewViewDelegate?
    @IBOutlet var slider: CPImageSlider!
    @IBOutlet var title: UILabel!
    @IBOutlet var countPhotos: UILabel!
    
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
