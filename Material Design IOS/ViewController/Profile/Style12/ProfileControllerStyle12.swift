//
//  ProfileControllerStyle12.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 10/31/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ProfileControllerStyle12: UIViewController, UITableViewDelegate, UITableViewDataSource, ProfileHeaderDelegate, ProfileHeaderStyle12Delegate, ProfileCellStyle6Delegate {
    
    var headerMenu = ProfileHeader()
    var header = ProfileHeaderStyle12()
    var table = UITableView()
    
    var img = NSArray()
    var name = NSArray()
    var counter = NSArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        img = [
            "\(baseAssetProfile)Profile-6-image1.jpg",
            "\(baseAssetProfile)Profile-6-image2.jpg",
            "\(baseAssetProfile)Profile-6-image3.jpg"
        ]
        
        name = ["Urban Skyscrapers", "Citywalks", "Antique Car"]
        counter = ["19 Photos", "19 Photos", "19 Photos"]
        
        createView()
        
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 241/255.0, green: 246/255.0, blue: 248/255.0, alpha: 1)

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
        
        // Create table
        table.frame = CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: self.view.frame.size.height-200)
        table.delegate = self;
        table.dataSource = self;
        table.backgroundColor = UIColor.init(red: 241/255.0, green: 246/255.0, blue: 248/255.0, alpha: 1)
        table.separatorColor = UIColor.clear
        table.allowsSelection = false
        table.register(UINib(nibName: "ProfileCellStyle6", bundle: nil), forCellReuseIdentifier: "ProfileCellStyle6")
        self.view.addSubview(table)
        
        // Create Header
        header = Bundle.main.loadNibNamed("ProfileHeaderStyle12", owner: nil, options: nil)?.first as! ProfileHeaderStyle12
        header.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: 150)
        header.name.text = "Michael Angelo"
        header.city.text = "Manhaattan, NY"
        header.delegate = self
        self.view .addSubview(header)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return img.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCellStyle6", for: indexPath) as! ProfileCellStyle6
    
        cell.img.downloadedFrom(link: "\(img[indexPath.row])", contentMode: .scaleAspectFill)
        cell.title.text = "\(name[indexPath.row])"
        cell.counter.text = "\(counter[indexPath.row])"
        
        cell.backgroundColor = UIColor.init(red: 241/255.0, green: 246/255.0, blue: 248/255.0, alpha: 1)
        cell.index = indexPath
        cell.delegate = self
        return cell
    }
    
    func pushCell(index: IndexPath) {
        FunctionDefault.AlertMessage(title: "\(index.row)", message: "", targetVC: self)
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
    
    // ProfileHeaderStyle12Delegate
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
