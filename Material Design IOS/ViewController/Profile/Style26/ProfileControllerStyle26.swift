//
//  ProfileControllerStyle26.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 10/31/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ProfileControllerStyle26: UIViewController, ProfileHeaderDelegate, ProfileMenuStyle26Delegate  {
    
    var headerMenu = ProfileHeader()
    var header = ProfileHeaderStyle26()
    var profileView = ProfilePhotoStyle26()
    var menu = ProfileMenuStyle26()
    
    var img = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        img = ["menuFoto", "menuVideo", "menuMessage", "menuSetting", "menuFriends", "menuNotif"]
        
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
        
        // Create Header
        header = Bundle.main.loadNibNamed("ProfileHeaderStyle26", owner: nil, options: nil)?.first as! ProfileHeaderStyle26
        header.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: 60)
        header.name.text = "Michael Hendley"
        header.city.text = "Manhattan, NY"
        self.view .addSubview(header)
        
        // function show or close menu left
        headerMenu.btnMenu.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        // Create profileView
        profileView = Bundle.main.loadNibNamed("ProfilePhotoStyle26", owner: nil, options: nil)?.first as! ProfilePhotoStyle26
        profileView.frame = CGRect(x: 0, y: 140, width: self.view.frame.size.width, height: 180)
        profileView.name.text = "Michael Angelo"
        profileView.city.text = "Manhattan, NY"
        self.view .addSubview(profileView)
        
        // Create menu
        menu = Bundle.main.loadNibNamed("ProfileMenuStyle26", owner: nil, options: nil)?.first as! ProfileMenuStyle26
        menu.frame = CGRect(x: 0, y: 320, width: self.view.frame.size.width, height: self.view.frame.size.height-320)
        
        let layout = UICollectionViewFlowLayout()
        
        if UIScreen.main.bounds.size.height == 568{
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            layout.itemSize = CGSize(width: self.view.frame.size.width/4, height: self.view.frame.size.width/4+15)
        }else{
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            layout.itemSize = CGSize(width: self.view.frame.size.width/3.9, height: self.view.frame.size.width/3.9+15)
        }
        
        menu.collection.setCollectionViewLayout(layout, animated: true)
        menu.collection.register(UINib(nibName: "ProfileMenuCellStyle26", bundle:nil), forCellWithReuseIdentifier: "ProfileMenuCellStyle26")
        menu.collection.isScrollEnabled = false
        
        menu.name = ["Photos", "Videos", "Messages", "Settings", "Friends", "Notifications"]
        menu.img = ["menuFoto", "menuVideo", "menuMessage", "menuSetting", "menuFriends", "menuNotif"]
        
        menu.delegate = self
        self.view .addSubview(menu)
        
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
    
    // ProfileMenuStyle26Delegate
    func pushMenu(index: IndexPath) {
        FunctionDefault.AlertMessage(title: "\(index.row)", message: "", targetVC: self)
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
