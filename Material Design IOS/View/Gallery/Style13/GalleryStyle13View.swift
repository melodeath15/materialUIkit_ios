//
//  GalleryStyle13View.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/24/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol GalleryStyle13ViewDelegate {
    func share()
    func edit()
    func close()
    func tapImgae(slider: CPImageSlider, index: Int)
    func targetIndex(index: Int)
}

class GalleryStyle13View: UIView, CPSliderDelegate {
    
    var delegate: GalleryStyle13ViewDelegate?

    @IBOutlet var slider: CPImageSlider!
    @IBOutlet var title: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var countOf: UILabel!
    @IBOutlet var btnShare: UIButton!
    @IBOutlet var btnEdit: UIButton!
    @IBOutlet var btnClose: UIButton!
    
    var imagesArray = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnEdit.layer.cornerRadius = btnEdit.frame.size.width/2
        btnEdit.clipsToBounds = true
        
        slider.delegate = self
    }
    
    @IBAction func pushShare(_ sender: Any) {
        delegate?.share()
    }
    
    @IBAction func pushBtnEdit(_ sender: Any) {
        delegate?.edit()
    }
    
    @IBAction func pushBtnClose(_ sender: Any) {
        delegate?.close()
    }
    
    func sliderImageTapped(slider: CPImageSlider, index: Int) {
        delegate?.tapImgae(slider: slider, index: index)
    }
    
    func sliderGetIndex(index: Int) {
        delegate?.targetIndex(index: index)
    }
    
}
