//
//  GalleryControllerStyle7.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/24/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class GalleryControllerStyle7: UIViewController, GalleryStyle6HeaderDelegate {

    var tableGallery = UITableView()
    var header = GalleryStyle6Header()
    var selectInt = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView()
        
        // add recevie notification selected
        NotificationCenter.default.addObserver(self, selector: #selector(recevie), name: NSNotification.Name(rawValue: "selected"), object: nil)

    }
    
    func recevie(getSelected: NSNotification){ // function receview notification
  
        if getSelected.object as! Int > 0{
            header.title.text = "\(getSelected.object as! Int) Selected"
            header.btmShare.isHidden = false
            header.btnSearch.setImage(UIImage(named: "Gallery-11-icon-delete"), for: .normal)
        }else{
            header.title.text = "Gallery"
            header.btmShare.isHidden = true
            header.btnSearch.setImage(UIImage(named: "search1"), for: .normal)
        }
        
        selectInt = getSelected.object as! Int
        
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // create header
        header = Bundle.main.loadNibNamed("GalleryStyle6Header", owner: nil, options: nil)?.first as! GalleryStyle6Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        
        header.btnMenu.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        header.delegate = self
        self.view.addSubview(header)
    }
    
    // GalleryStyle6HeaderDelegate
    func share() {
        FunctionDefault.AlertMessage(title: "Share", message: "", targetVC: self)
    }
    
    func menu() {
        // not use
    }
    
    func search() {
        if selectInt > 0{
            FunctionDefault.AlertMessage(title: "Delete", message: "", targetVC: self)
        }else{
            FunctionDefault.AlertMessage(title: "Search", message: "", targetVC: self)
        }
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
