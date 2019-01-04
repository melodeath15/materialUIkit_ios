//
//  GalleryControllerStyle13.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/24/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class GalleryControllerStyle13: UIViewController, GalleryStyle1HeaderDelegate, GalleryStyle13ViewDelegate {

    var header = GalleryStyle1Header()
    var footer = GalleryStyle13View()
    
    var name = NSArray()
    var timePost = NSArray()
    var indexPush = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indexPush = 0
        name = ["White Stripes Hipster Girl", "Still Objects", "Funny Stuff", "Toys", "Fashion", "Women"]
        timePost = ["Added yesterday 19.30", "Added yesterday 19.31", "Added yesterday 19.32", "Added yesterday 19.33", "Added yesterday 19.34", "Added yesterday 19.35"]
        
        createView() // function for create header, create collectionview
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // Create Header
        header = Bundle.main.loadNibNamed("GalleryStyle1Header", owner: nil, options: nil)?.first as! GalleryStyle1Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.btnSearch.isHidden = true
        header.title.text = "Mountain Haze"
        header.btnMenu.setImage(UIImage(named: "back1"), for: .normal)
        header.delegate = self
        self.view.addSubview(header)

        // Create Footer
        footer = Bundle.main.loadNibNamed("GalleryStyle13View", owner: nil, options: nil)?.first as! GalleryStyle13View
        footer.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80)
        footer.title.text = "\(name[0])"
        footer.time.text = "\(timePost[0])"
        footer.countOf.text = "1 of \(name.count-1)"
        
        footer.imagesArray = ["Gallery-12-img-1.png", "Gallery-3-img-1.png", "Gallery-3-img-2.png", "Gallery-3-img-3.png",  "Gallery-3-img-4.png"]
        footer.slider.images = footer.imagesArray
        footer.slider.autoSrcollEnabled = false
        footer.slider.enableArrowIndicator = false
        footer.slider.enablePageIndicator = false
        footer.slider.enableSwipe = true
        footer.slider.allowCircular = false
        
        footer.delegate = self
        self.view.addSubview(footer)
    }
    
    // ViewActivityStyle1HeaderDelegate
    func menu() {// function for back layout
        navigationController?.popViewController(animated: true)
    }
    
    func search() {// function for search
        // not use
    }
    
    func optional() {// function for menu option
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
    
    
    // GalleryStyle13ViewDelegate
    func tapImgae(slider: CPImageSlider, index: Int) {
        FunctionDefault.AlertMessage(title: "Index", message: "\(index)", targetVC: self)
    }
    
    func targetIndex(index: Int) {
        footer.title.text = "\(name[index])"
        footer.time.text = "\(timePost[index])"
        footer.countOf.text = "\(index+1) of \(name.count-1)"
        indexPush = index
    }
    
    func share(){
        FunctionDefault.AlertMessage(title: "Share", message: "\(indexPush)", targetVC: self)
    }
    
    func edit(){
        FunctionDefault.AlertMessage(title: "Edit", message: "\(indexPush)", targetVC: self)
    }
    func close(){
        FunctionDefault.AlertMessage(title: "Close", message: "\(indexPush)", targetVC: self)
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
