//
//  GalleryControllerStyle12.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/24/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class GalleryControllerStyle12: UIViewController, GalleryStyle12HeaderDelegate {

    var header = GalleryStyle12Header()
    var viewer = GalleryStyle12View()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // function for create header, create collectionview
    }
    
    func createView(){
        
        // Create viewer
        viewer = Bundle.main.loadNibNamed("GalleryStyle12View", owner: nil, options: nil)?.first as! GalleryStyle12View
        viewer.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        viewer.title.text = "White Stripes Hipster Girl"
        viewer.time.text = "Added Yesterday, 19.30"
        viewer.img.downloadedFrom(link: "\(baseAssetGallery)Gallery-12-img-1.png", contentMode: .scaleAspectFill)
        self.view.addSubview(viewer)
        
        // Create Header
        header = Bundle.main.loadNibNamed("GalleryStyle12Header", owner: nil, options: nil)?.first as! GalleryStyle12Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.btnMenu.setImage(UIImage(named: "back1"), for: .normal)
        header.delegate = self
        header.backgroundColor = UIColor.clear
        self.view.addSubview(header)
        
    }
    
    // GalleryStyle12HeaderDelegate
    func menu() {// function for back layout
        navigationController?.popViewController(animated: true)
    }
    
    func share() {
        FunctionDefault.AlertMessage(title: "Share", message: "", targetVC: self)
    }
    
    func edit() {
        FunctionDefault.AlertMessage(title: "Edit", message: "", targetVC: self)
    }
    
    func close() {
        FunctionDefault.AlertMessage(title: "Close", message: "", targetVC: self)
    }

    func option() {// function for menu option
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
    
    
