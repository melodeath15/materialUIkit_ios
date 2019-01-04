//
//  ProfileControllerStyle8.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 10/31/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ProfileControllerStyle8: UIViewController, UITableViewDelegate, UITableViewDataSource, ProfileHeaderDelegate, ProfileCellStyle8Delegate {
    
    var headerMenu = ProfileHeader()
    var header = ProfileHeaderStyle8()
    var table = UITableView()
    
    var img = NSArray()
    var name = NSArray()
    var love = NSArray()
    var viewer = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        img = [
            "\(baseAssetProfile)Profile-8-image1.jpg",
            "\(baseAssetProfile)Profile-8-image2.jpg",
            "\(baseAssetProfile)Profile-8-image3.jpg"
        ]
        
        name = ["Urban Skyscrapers", "The Cliff Hanger", "Cabin Interior"]
        love = ["1347", "1347", "1347"]
        viewer = ["19789", "19789", "19789"]
        
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
        header = Bundle.main.loadNibNamed("ProfileHeaderStyle8", owner: nil, options: nil)?.first as! ProfileHeaderStyle8
        header.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: 80)
        header.name.text = "Michael Hendley"
        header.title.text = "270 Followers - 345 Following"
        self.view .addSubview(header)
        
        
        // Create table
        table.frame = CGRect(x: 0, y: 160, width: self.view.frame.size.width, height: self.view.frame.size.height-160)
        table.delegate = self;
        table.dataSource = self;
        table.backgroundColor = UIColor.init(red: 241/255.0, green: 246/255.0, blue: 248/255.0, alpha: 1)
        table.separatorColor = UIColor.clear
        table.allowsSelection = false
        
        table.register(UINib(nibName: "ProfileCellStyle8", bundle: nil), forCellReuseIdentifier: "ProfileCellStyle8")
        self.view.addSubview(table)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return img.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCellStyle8", for: indexPath) as! ProfileCellStyle8
        
        cell.title.text = "\(name[indexPath.row])"
        cell.valueLove.text = "\(love[indexPath.row])"
        cell.valueView.text = "\(viewer[indexPath.row])"
        cell.img.downloadedFrom(link: "\(img[indexPath.row])", contentMode: .scaleAspectFill)
        
        cell.index = indexPath
        cell.delegate = self
        return cell
    }
    
    // ProfileCellStyle8
    func pushCell(index: IndexPath) {
        FunctionDefault.AlertMessage(title: "\(index.row)", message: "", targetVC: self)
    }
    // end
    
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
