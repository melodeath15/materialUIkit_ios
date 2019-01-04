//
//  GalleryControllerStyle11.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/24/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class GalleryControllerStyle11: UIViewController, GalleryStyle1HeaderDelegate, GalleryStyle11ViewDelegate {

    var header = GalleryStyle1Header()
    var viewer = GalleryStyle11View()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // function for create header, create collectionview
    }
    
    func createView(){
        
        // Create Header
        header = Bundle.main.loadNibNamed("GalleryStyle1Header", owner: nil, options: nil)?.first as! GalleryStyle1Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = "Mountain Haze"
        header.btnMenu.setImage(UIImage(named: "back1"), for: .normal)
        header.btnSearch.isHidden = true
        header.delegate = self
        self.view.addSubview(header)
        
        // Create viewer
        viewer = Bundle.main.loadNibNamed("GalleryStyle11View", owner: nil, options: nil)?.first as! GalleryStyle11View
        viewer.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80)
        viewer.img.downloadedFrom(link: "\(baseAssetGallery)Gallery-11-img-1.jpg", contentMode: .scaleAspectFill)
        viewer.delegate = self
        self.view.addSubview(viewer)
        
    }
    
    // GalleryStyle11ViewDelegate
    func share() {
        FunctionDefault.AlertMessage(title: "Share", message: "", targetVC: self)
    }
    
    func edit() {
        FunctionDefault.AlertMessage(title: "Edit", message: "", targetVC: self)
    }
    
    func close() {
        FunctionDefault.AlertMessage(title: "Close", message: "", targetVC: self)
    }
    // end
    
    // ViewActivityStyle1HeaderDelegate
    func menu() {// function for back layout
        navigationController?.popViewController(animated: true)
    }
    
    func search() {// function for search
        // is hidden
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
