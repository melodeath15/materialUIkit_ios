//
//  GalleryControllerStyle10.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/24/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class GalleryControllerStyle10: UIViewController, GalleryStyle1HeaderDelegate, GalleryStyle10ViewDelegate {

    var header = GalleryStyle1Header()
    var viewImg = GalleryStyle10View()
    var listImage = NSArray()
    var name = NSArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listImage = ["\(baseAssetGallery)Gallery-9-img-2.png", "\(baseAssetGallery)Gallery-10-img-1.png", "\(baseAssetGallery)Gallery-9-img-3.png", "\(baseAssetGallery)Gallery-9-img-4.png"]
        name = ["Citywalks", "Wooden Cabin Room", "Nature", "Mountain"]
        
        createView() // function for create header, create collectionview
    }
    
    func createView(){
        // Create Header
        header = Bundle.main.loadNibNamed("GalleryStyle1Header", owner: nil, options: nil)?.first as! GalleryStyle1Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = "Gallery"
        
        header.btnMenu.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        header.delegate = self
        self.view.addSubview(header)
        
        // Create ViewImg
        viewImg = Bundle.main.loadNibNamed("GalleryStyle10View", owner: nil, options: nil)?.first as! GalleryStyle10View
        viewImg.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80)
        viewImg.title.text = "Minimal Interior"
        viewImg.count.text = "\(listImage.count) Photos"
        viewImg.titleImg.text = "\(name[0])"
        viewImg.pageImg.text = "1 of \(listImage.count)"
        viewImg.data = listImage
        
        viewImg.collImg.register(UINib(nibName: "GalleryStyle10Cell", bundle: nil), forCellWithReuseIdentifier: "GalleryStyle10Cell")
        viewImg.collImg.contentInset = UIEdgeInsetsMake(10, 30, 10, 30)
        viewImg.collImg.decelerationRate = UIScrollViewDecelerationRateFast
        
        viewImg.delegate = self
        self.view.addSubview(viewImg)
        
    }
    
    // GalleryStyle10ViewDelegate
    func didSelectImg(index: NSIndexPath, data: NSArray) {
        FunctionDefault.AlertMessage(title: "Push Index = \(index.row)", message: "\(data[index.row])", targetVC: self)
    }
    
    func showImg(index: Int, data: NSArray) {
        viewImg.titleImg.text = "\(name[index])"
        viewImg.pageImg.text = "\(index+1) of \(listImage.count)"
    }
    // end
    
    
    // ViewActivityStyle1HeaderDelegate
    func menu() {// function for back layout
        navigationController?.popViewController(animated: true)
    }
    
    func search() {// function for search
        FunctionDefault.AlertMessage(title: "Search", message: "", targetVC: self)
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
