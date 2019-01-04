//
//  ProfileControllerStyle20.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 10/31/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ProfileControllerStyle20: UIViewController, UITableViewDelegate, UITableViewDataSource, ProfileHeaderDelegate, ProfileCollectionMenuStyle19Delegate, ProfileCellStyle20Delegate {
    
    var header = ProfileHeader()
    var tap = ProfileCollectionMenuStyle19()
    var table = UITableView()
    
    var status = Int()
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
        self.view.backgroundColor = UIColor.init(red: 241/255.0, green: 246/255.0, blue: 248/255.0, alpha: 1)
        
        // Create headerMenu
        header = Bundle.main.loadNibNamed("ProfileHeader", owner: nil, options: nil)?.first as! ProfileHeader
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = "Profile"
        header.delegate = self
        self.view .addSubview(header)
        
        // function show or close menu left
        header.btnMenu.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        // Create tap
        tap = Bundle.main.loadNibNamed("ProfileCollectionMenuStyle19", owner: nil, options: nil)?.first as! ProfileCollectionMenuStyle19
        tap.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: 60)
        tap.active = 1
        status = 1
        tap.data = ["iconDashboardWhite", "iconDashboardWhite", "iconDashboardWhite", "iconDashboardWhite"]
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: self.view.frame.size.width/5, height: 50)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        tap.collection.setCollectionViewLayout(layout, animated: true)
        tap.collection.isScrollEnabled = false
        
        tap.collection.register(UINib(nibName: "ProfileCellStyle19", bundle: nil), forCellWithReuseIdentifier: "ProfileCellStyle19")
        tap.delegate = self
        tap.collection.backgroundColor = UIColor.init(red: 141/255, green: 40/255, blue: 170/255, alpha: 1)
        tap.backgroundColor = UIColor.init(red: 141/255, green: 40/255, blue: 170/255, alpha: 1)
        self.view .addSubview(tap)
        
        // create table
        table.frame = CGRect(x: 0, y: 140, width: self.view.frame.size.width, height: self.view.frame.size.height-140)
        table.delegate = self;
        table.dataSource = self;
        table.backgroundColor = UIColor.clear
        table.separatorColor = UIColor.groupTableViewBackground
        table.allowsSelection = false
        
        // register UINib for GalleryStyle1Collection
        
        table.register(UINib(nibName: "ProfileCellPhotoStyle19", bundle: nil), forCellReuseIdentifier: "ProfileCellPhotoStyle19")
        table.register(UINib(nibName: "ProfileCellStyle20", bundle: nil), forCellReuseIdentifier: "ProfileCellStyle20")
        self.view .addSubview(table)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return img.count + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 120
        default:
            return 65
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCellPhotoStyle19", for: indexPath)as! ProfileCellPhotoStyle19
            
            cell.name.text = "Michael Angelo"
            cell.posisi.text = "UI Designer"
            
            return cell

        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCellStyle20", for: indexPath)as! ProfileCellStyle20
            
            cell.name.text = "\(name[indexPath.row-1])"
            cell.posisi.text = "\(city[indexPath.row-1])"
            cell.img.downloadedFrom(link: "\(img[indexPath.row-1])", contentMode: .scaleAspectFill)

            cell.delegate = self
            cell.index = indexPath
            cell.backgroundColor = UIColor.clear
            return cell

        }
    
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
    
    // ProfileCollectionMenuStyle19Delegate
    func activeMenu(index: IndexPath) {
        FunctionDefault.AlertMessage(title: "\(index.row)", message: "", targetVC: self)
    }
    // end
    
    // ProfileCellStyle20Delegate
    func plush(index: IndexPath) {
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
