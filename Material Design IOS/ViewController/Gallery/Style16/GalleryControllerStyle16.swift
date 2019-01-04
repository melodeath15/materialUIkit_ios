//
//  GalleryControllerStyle16.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/24/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class GalleryControllerStyle16: UIViewController, GalleryStyle1HeaderDelegate {

    var header = GalleryStyle1Header()
    var viewer = GalleryStyle16View()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // function for create header, create collectionview
    }
    
    func createView(){
        
        // Create viewer
        viewer = Bundle.main.loadNibNamed("GalleryStyle16View", owner: nil, options: nil)?.first as! GalleryStyle16View
        viewer.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        viewer.title.text = "Weasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and altruistic"
        viewer.time.text = "An hour ago"
        viewer.valueLove.text = "1347"
        viewer.valueView.text = "19789"
        viewer.img.downloadedFrom(link: "\(baseAssetGallery)Gallery-16-img-1.png", contentMode: .scaleAspectFill)
        self.view.addSubview(viewer)
        
        // Create Header
        header = Bundle.main.loadNibNamed("GalleryStyle1Header", owner: nil, options: nil)?.first as! GalleryStyle1Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = "Fullscreen"
        header.btnSearch.isHidden = true
        header.btnOptional.setImage(UIImage(named: "search1"), for: .normal)
        header.btnMenu.setImage(UIImage(named: "back1"), for: .normal)
        header.delegate = self
        header.backgroundColor = UIColor.clear
        self.view.addSubview(header)
        
    }
    
    // GalleryStyle12HeaderDelegate
    func menu() {// function for back layout
        navigationController?.popViewController(animated: true)
    }
    
    func search() {
        // hidden change optional
    }
    
    func optional() {// function for menu option
        FunctionDefault.AlertMessage(title: "Search", message: "", targetVC: self)

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
