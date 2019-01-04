//
//  GalleryControllerStyle22.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/25/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class GalleryControllerStyle22: UIViewController, GalleryStyle22HeaderDelegate, GalleryStyle22ViewDelegate {

    var header = GalleryStyle22Header()
    var footer = GalleryStyle22View()
    var name = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name = ["Hot Coffee, Bread & Pecans", "Still Objects", "Funny Stuff", "Toys", "Fashion", "Women"]
        createView() // function for create header, create collectionview
    }
    
    func createView(){
        
        // Create Header
        header = Bundle.main.loadNibNamed("GalleryStyle22Header", owner: nil, options: nil)?.first as! GalleryStyle22Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = "My Photos Portofolio"
        header.countImg.text = "1 of \(name.count-1) Photos"
        header.btnMenu.setImage(UIImage(named: "back1"), for: .normal)
        header.delegate = self
        self.view.addSubview(header)
        
        // Create Footer
        footer = Bundle.main.loadNibNamed("GalleryStyle22View", owner: nil, options: nil)?.first as! GalleryStyle22View
        footer.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80)
        footer.title.text = "\(name[0])"
        
        footer.imagesArray = ["\(baseAssetGallery)Gallery-22-img-1.png", "\(baseAssetGallery)Gallery-3-img-1.png", "\(baseAssetGallery)Gallery-3-img-2.png", "\(baseAssetGallery)Gallery-3-img-3.png", "\(baseAssetGallery)Gallery-3-img-4.png"]
        footer.slider.images = footer.imagesArray
        footer.slider.autoSrcollEnabled = false
        footer.slider.enableArrowIndicator = false
        footer.slider.enablePageIndicator = false
        footer.slider.enableSwipe = true
        footer.slider.allowCircular = false
        footer.slider.autoSrcollEnabled = false
        
        footer.delegate = self
        self.view.addSubview(footer)
        
    }
    
    //GalleryStyle22ViewDelegate
    func tapImgae(slider: CPImageSlider, index: Int){
        FunctionDefault.AlertMessage(title: "Index", message: "\(index)", targetVC: self)
    }
 
    func targetIndex(index: Int){
        footer.title.text = "\(name[index])"
        header.countImg.text = "\(index+1) of \(name.count-1) Photos"
    }
    // end
    
    // GalleryStyle12HeaderDelegate
    func menu() {// function for back layout
        navigationController?.popViewController(animated: true)
    }
    
    func Optional() { // function for menu option
        let actionSheet: UIAlertController = UIAlertController(title: "Choose Option", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {_ in // function for butoon down
            FunctionDefault.AlertMessage(title: "Cancel", message: "", targetVC: self)
        }
        actionSheet.addAction(cancelAction)
        
        let saveAction = UIAlertAction(title: "Save", style: .default){ _ in // function button custom
            FunctionDefault.AlertMessage(title: "Save", message: "", targetVC: self)
        }
        actionSheet.addAction(saveAction)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive){ _ in // function button custom with destructive
            FunctionDefault.AlertMessage(title: "Delete", message: "", targetVC: self)
        }
        actionSheet.addAction(deleteAction)
        
        actionSheet.popoverPresentationController?.sourceView = self.view
        actionSheet.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.width-20, y: 60, width: 1, height: 1)
        
        self.present(actionSheet, animated: true, completion: nil)
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
