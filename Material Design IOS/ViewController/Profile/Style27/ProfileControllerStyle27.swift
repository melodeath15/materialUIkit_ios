//
//  ProfileControllerStyle27.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 10/31/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ProfileControllerStyle27: UIViewController, ProfileHeaderDelegate, ProfileHeaderViewStyle27Delegate {
    
    var headerMenu = ProfileHeader()
    var header = ProfileHeaderViewStyle27()
    var viewer = ProfileViewStyle27()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView()
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.groupTableViewBackground
        
        // Create headerMenu
        headerMenu = Bundle.main.loadNibNamed("ProfileHeader", owner: nil, options: nil)?.first as! ProfileHeader
        headerMenu.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        headerMenu.title.text = "Profile"
        headerMenu.delegate = self
        self.view .addSubview(headerMenu)
        
        // function show or close menu left
        headerMenu.btnMenu.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        // Create Header
        header = Bundle.main.loadNibNamed("ProfileHeaderViewStyle27", owner: nil, options: nil)?.first as! ProfileHeaderViewStyle27
        header.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: 70)
        header.delegate = self
        self.view .addSubview(header)
        
        // Create viewer
        viewer = Bundle.main.loadNibNamed("ProfileViewStyle27", owner: nil, options: nil)?.first as! ProfileViewStyle27
        viewer.frame = CGRect(x: 16, y: 150, width: self.view.frame.size.width-32, height: self.view.frame.size.height-160)
        viewer.img.downloadedFrom(link: "\(baseAssetProfile)Profile-27-image.jpg", contentMode: .scaleAspectFill)
        viewer.name.text = "Waiting in Woods"
        viewer.city.text = "An hour ago"
        viewer.value1.text = "1347"
        viewer.value2.text = "19789"
        self.view .addSubview(viewer)
        
    }
    
    // ProfileHeaderDelegate
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
    
    // ProfileHeaderViewStyle27Delegate
    func plush() {
        FunctionDefault.AlertMessage(title: "Plush", message: "", targetVC: self)
    }
    // end
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
