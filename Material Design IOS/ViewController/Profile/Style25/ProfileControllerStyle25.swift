//
//  ProfileControllerStyle25.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 10/31/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ProfileControllerStyle25: UIViewController, UITableViewDelegate, UITableViewDataSource, ProfileHeaderDelegate, ProfileTapCollectionDelegate, ProfileStyle3CellDelegate {
    
    var headerMenu = ProfileHeader()
    var header = ProfileHeaderStyle25()
    var tap = ProfileTapCollection()
    var table = UITableView()
    
    var status = Int()
    var img = NSArray()
    var name =  NSArray()
    var deskripsi = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        img = [
            "\(baseAssetProfile)Profile-25-post1.jpg",
            "\(baseAssetProfile)Profile-25-post2.jpg",
            "\(baseAssetProfile)Profile-25-post3.jpg",
            "\(baseAssetProfile)Profile-25-post4.jpg",
        ]
        
        name = ["Michella Hendly", "Kimberly White", "Steven Rogers", "Amy Pattersson", "Hannah Paige"]
        deskripsi = ["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard"]
        
        createView()
    }
    
    func createView(){
        
        // Create headerMenu
        headerMenu = Bundle.main.loadNibNamed("ProfileHeader", owner: nil, options: nil)?.first as! ProfileHeader
        headerMenu.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        headerMenu.title.text = "Profile"
        headerMenu.delegate = self
        self.view .addSubview(headerMenu)
        
        // Create Header
        header = Bundle.main.loadNibNamed("ProfileHeaderStyle25", owner: nil, options: nil)?.first as! ProfileHeaderStyle25
        header.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: 80)
        header.name.text = "Michael Hendley"
        header.posisi.text = "270 Followers - 345 Followings"
        self.view .addSubview(header)
        
        // function show or close menu left
        headerMenu.btnMenu.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        // Create tap
        tap = Bundle.main.loadNibNamed("ProfileTapCollection", owner: nil, options: nil)?.first as! ProfileTapCollection
        tap.frame = CGRect(x: 0, y: 160, width: self.view.frame.size.width, height: 60)
        tap.counterMenu = 3
        tap.active = 0
        status = 0
        tap.data = ["359", "10.289", "4317"]
        tap.title = ["Photos", "Followers", "Followings"]
        tap.delegate = self
        self.view .addSubview(tap)
        
        // Create table
        table.frame = CGRect(x: 0, y: 220, width: self.view.frame.size.width, height: self.view.frame.size.height-220)
        table.delegate = self;
        table.dataSource = self;
        table.backgroundColor = UIColor.clear
        table.separatorColor = UIColor.groupTableViewBackground
        table.allowsSelection = false
        table.register(UINib(nibName: "ProfileCellStyle25", bundle: nil), forCellReuseIdentifier: "ProfileCellStyle25")
        self.view.addSubview(table)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch status {
        case 0:
            return img.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch status {
        case 0:
            return 100
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCellStyle25", for: indexPath) as! ProfileCellStyle25
        
        switch status {
        case 0:
            cell.name.text = "\(name[indexPath.row])"
            cell.deskripsi.text = "\(deskripsi[indexPath.row])"
            cell.profile.downloadedFrom(link: "\(img[indexPath.row])", contentMode: .scaleAspectFill)
//            cell.index = indexPath
        default:
            break
        }
        
        cell.backgroundColor = UIColor.init(red: 241/255.0, green: 246/255.0, blue: 248/255.0, alpha: 1)
//        cell.delegate = self
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
    
    // ProfileTapCollectionDelegate
    func activeMenu(index: IndexPath) {
        status = index.row
        table.reloadData()
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
