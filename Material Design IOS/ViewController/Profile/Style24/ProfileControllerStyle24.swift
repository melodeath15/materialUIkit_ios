//
//  ProfileControllerStyle24.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 10/31/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ProfileControllerStyle24: UIViewController, UITableViewDelegate, UITableViewDataSource, ProfileCollectionMenuStyle19Delegate, ProfileHeaderDelegate, ProfileHeaderCellTyle14Delegate, GalleryStyle1CollectionDelegate {
    
    var header = ProfileHeader()
    var tap = ProfileCollectionMenuStyle19()
    var status = Int()
    var table = UITableView()
    
    var listName = NSArray()
    var list1 = NSArray()
    var list2 = NSArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listName = ["CAMERA", "WALLPAPER"]
        list1 = [
            "\(baseAssetGallery)Gallery-1-img-1.png",
            "\(baseAssetGallery)Gallery-1-img-2.png",
            "\(baseAssetGallery)Gallery-1-img-3.png",
            "\(baseAssetGallery)Gallery-1-img-4.png",
            "\(baseAssetGallery)Gallery-1-img-6.png",
            "\(baseAssetGallery)Gallery-1-img-1.png",
            "\(baseAssetGallery)Gallery-1-img-1.png",
            "\(baseAssetGallery)Gallery-1-img-1.png"
        ]
        
        list2 = [
            "\(baseAssetGallery)Gallery-1-img-8.png",
            "\(baseAssetGallery)Gallery-1-img-9.png",
            "\(baseAssetGallery)Gallery-1-img-10.png",
            "\(baseAssetGallery)Gallery-1-img-11.png",
            "\(baseAssetGallery)Gallery-1-img-1.png",
            "\(baseAssetGallery)Gallery-1-img-11.png",
            "\(baseAssetGallery)Gallery-1-img-12.png"
        ]
        
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
        tap.active = 0
        status = 0
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
        table.separatorColor = UIColor.clear
        table.allowsSelection = false
        
        // register UINib for GalleryStyle1Collection
        table.register(UINib(nibName: "ProfileHeaderCellStyle24", bundle: nil), forCellReuseIdentifier: "ProfileHeaderCellStyle24")
        table.register(UINib(nibName: "GalleryStyle1Collection", bundle: nil), forCellReuseIdentifier: "GalleryStyle1Collection")
        self.view .addSubview(table)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listName.count + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 200
        }else{
            if list1.count > 5 {
                return (self.view.frame.size.width/4 * 2) + 80
            }else{
                return (self.view.frame.size.width/4) + 80
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileHeaderCellStyle24", for: indexPath)as! ProfileHeaderCellStyle24
            
            cell.bg.downloadedFrom(link: "\(baseAssetProfile)Profile-24-header.jpg", contentMode: .scaleAspectFill)
            cell.name.text = "Michael Angelo"
            cell.city.text = "Manhattan, NY"
            
            cell.backgroundColor = UIColor.clear
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "GalleryStyle1Collection", for: indexPath)as! GalleryStyle1Collection
            
            cell.title.text = listName[indexPath.row-1] as? String
            
            if indexPath.row == 1 {
                cell.data = list1
                
                let layout = UICollectionViewFlowLayout()
                
                if UIScreen.main.bounds.size.height == 568{
                    layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
                    layout.itemSize = CGSize(width: self.view.frame.size.width/4, height: self.view.frame.size.width/4)
                }else{
                    layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
                    layout.itemSize = CGSize(width: self.view.frame.size.width/3.9, height: self.view.frame.size.width/3.9)
                }
                
                
                cell.collectionImg.setCollectionViewLayout(layout, animated: true)
                
            }else{
                cell.data = list2
                
                let layout = UICollectionViewFlowLayout()
                
                if UIScreen.main.bounds.size.height == 568{
                    layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
                    layout.itemSize = CGSize(width: self.view.frame.size.width/4, height: self.view.frame.size.width/4)
                }else{
                    layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
                    layout.itemSize = CGSize(width: self.view.frame.size.width/3.9, height: self.view.frame.size.width/3.9)
                }
                
                cell.collectionImg.setCollectionViewLayout(layout, animated: true)
                
            }
            
            cell.collectionImg.register(UINib(nibName: "GalleryStyle1Cell", bundle:nil), forCellWithReuseIdentifier: "GalleryStyle1Cell")
            cell.collectionImg.tag = indexPath.row-1
            cell.collectionImg.isScrollEnabled = false
            
            cell.delegate = self
            return cell
        }
    }
    
    // GalleryStyle1CollectionDelegate
    func pushCell(tag: Int, index: Int, data: NSArray) {
        
        if index > 4 {
            FunctionDefault.AlertMessage(title: "Show More", message: "", targetVC: self)
        }else{
            FunctionDefault.AlertMessage(title: "\(listName[tag])", message: "\(index) Name = \(data[index])", targetVC: self)
        }
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
    
    // ProfileCollectionMenuStyle19Delegate
    func activeMenu(index: IndexPath) {
        FunctionDefault.AlertMessage(title: "\(index.row)", message: "", targetVC: self)
    }
    // end
    
    // ProfileHeaderCellTyle14Delegate
    func plush() {
        FunctionDefault.AlertMessage(title: "Plush", message: "", targetVC: self)
    }
    
    func share() {
        FunctionDefault.AlertMessage(title: "Share", message: "", targetVC: self)
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
