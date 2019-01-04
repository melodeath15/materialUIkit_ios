//
//  GalleryControllerStyle17.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/25/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class GalleryControllerStyle17: UIViewController, GalleryStyle1HeaderDelegate, GalleryStyle17ViewViewDelegate {

    var header = GalleryStyle1Header()
    var footer = GalleryStyle17View()
    var name = NSArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        name = ["Hipster Girl Round Glasses", "Still Objects", "Funny Stuff", "Toys", "Fashion", "Women"]
        createView() // function for create header, create collectionview
    }
    
    func createView(){
        
        // Create Footer
        footer = Bundle.main.loadNibNamed("GalleryStyle17View", owner: nil, options: nil)?.first as! GalleryStyle17View
        footer.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        footer.title.text = "\(name[0])"
        footer.countPhotos.text = "1 of \(name.count-1) Photos"
        
        footer.imagesArray = ["\(baseAssetGallery)Gallery-17-img-1.png", "\(baseAssetGallery)Gallery-3-img-1.png", "\(baseAssetGallery)Gallery-3-img-2.png", "\(baseAssetGallery)Gallery-3-img-3.png", "\(baseAssetGallery)Gallery-3-img-4.png"]
        footer.slider.images = footer.imagesArray
        footer.slider.autoSrcollEnabled = false
        footer.slider.enableArrowIndicator = true
        footer.slider.enablePageIndicator = false
        footer.slider.enableSwipe = true
        footer.slider.allowCircular = false
        footer.slider.autoSrcollEnabled = false
        
        footer.delegate = self
        self.view.addSubview(footer)
        
        // Create Header
        header = Bundle.main.loadNibNamed("GalleryStyle1Header", owner: nil, options: nil)?.first as! GalleryStyle1Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = ""
        header.btnSearch.isHidden = true
        header.btnOptional.isHidden = true
        header.btnMenu.setImage(UIImage(named: "back1"), for: .normal)
        header.backgroundColor = UIColor.clear
        header.delegate = self
        self.view.addSubview(header)
        
    }
    
    // GalleryStyle12HeaderDelegate
    func menu() {// function for back layout
        navigationController?.popViewController(animated: true)
    }
    
    func search() {
        // hidden
    }
    
    func optional() {// function for menu option
        // hidden
    }
    // end
    
    // GalleryStyle17ViewViewDelegate
    func tapImgae(slider: CPImageSlider, index: Int){
        FunctionDefault.AlertMessage(title: "Index", message: "\(index)", targetVC: self)
    }
    func targetIndex(index: Int){
        footer.title.text = "\(name[index])"
        footer.countPhotos.text = "\(index+1) of \(name.count-1) Photos"
    }
    // end
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent // return for status bar lightcontent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
