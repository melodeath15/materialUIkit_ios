//
//  ProfileControllerStyle3.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 10/31/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ProfileControllerStyle3: UIViewController, UITableViewDelegate, UITableViewDataSource, ProfileHeaderDelegate, ProfileStyle3CellDelegate, ProfileFooterStyle3Delegate {
    
    var headerMenu = ProfileHeader()
    var header = ProfileHeaderStyle3()
    var footer = ProfileFooterStyle3()
    var table = UITableView()
    
    var img = NSArray()
    var name =  NSArray()
    var city = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        img = [
            "\(baseAssetProfile)Profile-2-friend1.png",
            "\(baseAssetProfile)Profile-2-friend2.png",
            "\(baseAssetProfile)Profile-2-friend3.png",
            "\(baseAssetProfile)Profile-2-friend4.png",
            "\(baseAssetProfile)Profile-2-friend5.png"
        ]
        
        name = ["Michella Hendly", "Kimberly White", "Steven Rogers", "Amy Pattersson", "Hannah Paige"]
        city = ["San Fransisco, CA", "Manhattan, NY", "Brookly, NY", "Little Indian, ABQ", "San Fransisco, CA"]
        
        createView()
    }
    
    func createView(){
        
        // Create Header
        header = Bundle.main.loadNibNamed("ProfileHeaderStyle3", owner: nil, options: nil)?.first as! ProfileHeaderStyle3
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 180)
        header.name.text = "Michael Angelo"
        header.city.text = "Manhattan, NY"
        header.bgImg.downloadedFrom(link: "\(baseAssetProfile)Profile-2-header.png", contentMode: .scaleAspectFill)
        self.view .addSubview(header)
        
        // Create headerMenu
        headerMenu = Bundle.main.loadNibNamed("ProfileHeader", owner: nil, options: nil)?.first as! ProfileHeader
        headerMenu.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        headerMenu.title.text = "Profile"
        headerMenu.backgroundColor = UIColor.clear
        headerMenu.delegate = self
        self.view .addSubview(headerMenu)
        
        // function show or close menu left
        headerMenu.btnMenu.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        // Create table
        table.frame = CGRect(x: 0, y: 180, width: self.view.frame.size.width, height: self.view.frame.size.height-180-70)
        table.delegate = self;
        table.dataSource = self;
        table.backgroundColor = UIColor.clear
        table.separatorColor = UIColor.groupTableViewBackground
        table.allowsSelection = false
        table.register(UINib(nibName: "ProfileStyle3Cell", bundle: nil), forCellReuseIdentifier: "ProfileStyle3Cell")
        self.view.addSubview(table)
        
        
        // Create Footer
        footer = Bundle.main.loadNibNamed("ProfileFooterStyle3", owner: nil, options: nil)?.first as! ProfileFooterStyle3
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-70, width: self.view.frame.size.width, height: 70)
        footer.btnFollow.setTitle("Follow Me", for: .normal)
        footer.delegate = self
        self.view .addSubview(footer)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return img.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileStyle3Cell", for: indexPath) as! ProfileStyle3Cell
        
        cell.title.text = "\(name[indexPath.row])"
        cell.city.text = "\(city[indexPath.row])"
        cell.img.downloadedFrom(link: "\(img[indexPath.row])", contentMode: .scaleAspectFill)
        
        cell.index = indexPath
        cell.delegate = self
        return cell
    }
    
    // ProfileStyle3CellDelegate
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
    
    // ProfileFooterStyle3Delegate
    func Follow() {
        FunctionDefault.AlertMessage(title: "Follow Me", message: "", targetVC: self)
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
