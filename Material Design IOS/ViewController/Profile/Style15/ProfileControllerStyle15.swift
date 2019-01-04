//
//  ProfileControllerStyle15.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 10/31/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ProfileControllerStyle15: UIViewController, UITableViewDelegate, UITableViewDataSource, ProfileHeaderDelegate, ProfileHeaderCellTyle14Delegate, ProfileCollectionStyle15Delegate, GalleryStyle4CellDelegate {
    
    var header = ProfileHeader()
    var tableGallery = UITableView()
    var list = NSArray()
    var status = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list = ["\(baseAssetGallery)Gallery-4-img-1.png", "\(baseAssetGallery)Gallery-4-img-2.png"]
        createView() // function for create header, create collectionview
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
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
        
        // create table
        tableGallery.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80)
        tableGallery.delegate = self;
        tableGallery.dataSource = self;
        tableGallery.backgroundColor = UIColor.clear
        tableGallery.separatorColor = UIColor.clear
        tableGallery.allowsSelection = false
        
        // register UINib for GalleryStyle1Collection
        
        tableGallery.register(UINib(nibName: "ProfileHeaderCellTyle14", bundle: nil), forCellReuseIdentifier: "ProfileHeaderCellTyle14")
        tableGallery.register(UINib(nibName: "ProfileCollectionStyle15", bundle: nil), forCellReuseIdentifier: "ProfileCollectionStyle15")
        tableGallery.register(UINib(nibName: "GalleryStyle4Cell", bundle: nil), forCellReuseIdentifier: "GalleryStyle4Cell")
        self.view .addSubview(tableGallery)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count + 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 150
        case 1:
            return 60
        default:
            return 250
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileHeaderCellTyle14", for: indexPath)as! ProfileHeaderCellTyle14
            
            cell.name.text = "Michael Angelo"
            cell.city.text = "San Fransisca, CA"
            
            cell.delegate = self
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCollectionStyle15", for: indexPath)as! ProfileCollectionStyle15
            
            let layout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            layout.itemSize = CGSize(width: self.view.frame.size.width/4, height: 50)
            layout.minimumLineSpacing = 10
            layout.minimumInteritemSpacing = 10
            
            cell.collection.setCollectionViewLayout(layout, animated: true)
            cell.collection.register(UINib(nibName: "ProfileCellStyle15", bundle:nil), forCellWithReuseIdentifier: "ProfileCellStyle15")
            cell.collection.isScrollEnabled = false
            cell.active = 0
            status = 0
            
            cell.data = ["iconDashboardBlack", "iconDashboardBlack", "iconDashboardBlack"]

            cell.delegate = self
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "GalleryStyle4Cell", for: indexPath)as! GalleryStyle4Cell
            
            cell.img.downloadedFrom(link: "\(list[indexPath.row-2])", contentMode: .scaleAspectFill)
            cell.valueLove.text = "1347"
            cell.valueView.text = "19789"
            cell.valueTime.text = "An hour ago"
            cell.backgroundColor = UIColor.clear
            
            cell.index = indexPath as NSIndexPath
            cell.delegate = self
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
    
    // ProfileHeaderCellTyle14Delegate
    func plush() {
        FunctionDefault.AlertMessage(title: "Plush", message: "", targetVC: self)
    }
    
    func share() {
        FunctionDefault.AlertMessage(title: "Share", message: "", targetVC: self)
    }
    // end
    
    // ProfileCollectionStyle15Delegate
    func activeMenu(index: IndexPath) {
        FunctionDefault.AlertMessage(title: "\(index.row)", message: "", targetVC: self)
    }
    // end
    
    // GalleryStyle4CellDelegate
    func pushCell(index: NSIndexPath) {
        FunctionDefault.AlertMessage(title: "\(index.row)", message: "", targetVC: self)
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
