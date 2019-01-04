//
//  GalleryControllerStyle25.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/25/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class GalleryControllerStyle25: UIViewController, GalleryStyle1HeaderDelegate, GalleryStyle25CollectionviewDelegate {

    var collection = GalleryStyle25Collectionview()
    var header = GalleryStyle1Header()
    var cell = GalleryStyle23Cell()
    
    var list = NSArray()
    var name = NSArray()
    var tagName = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list = ["\(baseAssetGallery)Gallery-25-img-1", "\(baseAssetGallery)Gallery-23-img-1.png", "\(baseAssetGallery)Gallery-23-img-2.png"]
        name = ["Japanese Cuisine  Ingredients Collections", "Workspaces", "Funky Bedroom"]
        tagName = ["Desk, Interior, Workspaces", "Interior, Cabin"]
        createView()
        
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.black

        collection = Bundle.main.loadNibNamed("GalleryStyle25Collectionview", owner: nil, options: nil)?.first as! GalleryStyle25Collectionview
        collection.frame = CGRect(x: 0, y: -20, width: self.view.frame.size.width, height: self.view.frame.size.height+20)
        collection.dataImg = list
        collection.dataName = name
        collection.tagName = tagName
        collection.collectionMenu.register(UINib(nibName: "GalleryStyle23Cell", bundle:nil),forCellWithReuseIdentifier: "GalleryStyle23Cell")
        collection.collectionMenu.register(UINib(nibName: "GalleryStyle25Header", bundle:nil), forCellWithReuseIdentifier: "GalleryStyle25Header")
        collection.delegate = self
        self.view.addSubview(collection)
        
        // create header
        header = Bundle.main.loadNibNamed("GalleryStyle1Header", owner: nil, options: nil)?.first as! GalleryStyle1Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = ""
        header.btnSearch.isHidden = true
        header.btnOptional.isHidden = true
        header.backgroundColor = UIColor.clear
        
        header.btnMenu.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        header.delegate = self
        self.view.addSubview(header)
        
    }
    
    // GalleryStyle25CollectionviewDelegate
    func pushBtnShare(index: NSIndexPath){
        FunctionDefault.AlertMessage(title: "Share", message: "\(index.row)", targetVC: self)
    }
    // end
    
    // GalleryStyle1HeaderDelegate
    func menu(){
        // not use
    }
    
    func search() {
        FunctionDefault.AlertMessage(title: "Search", message: "", targetVC: self)
    }
    
    func optional() {
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
