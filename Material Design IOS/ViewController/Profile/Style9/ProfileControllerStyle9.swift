//
//  ProfileControllerStyle9.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 10/31/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ProfileControllerStyle9: UIViewController, ProfileHeaderDelegate, ProfileFooterStyle9Delegate  {
    
    var headerMenu = ProfileHeader()
    var header = ProfileViewStyle9()
    var footer = ProfileFooterStyle9()
    var table = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView()
    }
    
    func createView(){
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
        header = Bundle.main.loadNibNamed("ProfileViewStyle9", owner: nil, options: nil)?.first as! ProfileViewStyle9
        header.frame = CGRect(x: 16, y: 80, width: self.view.frame.size.width-32, height: self.view.frame.size.height-90-80)
        header.img.downloadedFrom(link: "\(baseAssetProfile)Profile-9-image.jpg", contentMode: .scaleAspectFill)
        header.name.text = "Michael Angelo"
        header.city.text = "Manhattan, NY"
        self.view .addSubview(header)
        
        // Create footer
        footer = Bundle.main.loadNibNamed("ProfileFooterStyle9", owner: nil, options: nil)?.first as! ProfileFooterStyle9
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-80, width: self.view.frame.size.width, height: 80)
        footer.delegate = self
        self.view .addSubview(footer)
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
    
    func follow() {
        FunctionDefault.AlertMessage(title: "Follow", message: "", targetVC: self)
    }
    
    func viewProfile() {
        FunctionDefault.AlertMessage(title: "View", message: "", targetVC: self)
    }
    
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
