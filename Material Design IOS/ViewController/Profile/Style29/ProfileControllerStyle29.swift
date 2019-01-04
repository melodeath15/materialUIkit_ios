//
//  ProfileControllerStyle29.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 10/31/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ProfileControllerStyle29: UIViewController, UITableViewDelegate, UITableViewDataSource, ProfileHeaderDelegate, ProfileHeaderStyle29Delegate, GalleryStyle4CellDelegate {
    
    var header = ProfileHeader()
    var headerCell = ProfileHeaderStyle29()
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
        
        // Create headerCell
        headerCell = Bundle.main.loadNibNamed("ProfileHeaderStyle29", owner: nil, options: nil)?.first as! ProfileHeaderStyle29
        headerCell.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: 190)
        headerCell.name.text = "Michael Angelo"
        headerCell.ciy.text = "San Fransisco, CA"
        headerCell.valuePhotos.text = "56"
        headerCell.valueStories.text = "14"
        headerCell.valueFriends.text = "136"
        headerCell.delegate = self
        self.view .addSubview(headerCell)
        
        // create table
        tableGallery.frame = CGRect(x: 0, y: 270, width: self.view.frame.size.width, height: self.view.frame.size.height-280)
        tableGallery.delegate = self;
        tableGallery.dataSource = self;
        tableGallery.backgroundColor = UIColor.clear
        tableGallery.separatorColor = UIColor.clear
        tableGallery.allowsSelection = false
        
        // register UINib for GalleryStyle1Collection
        tableGallery.register(UINib(nibName: "ProfileHeaderTableStyle29", bundle: nil), forHeaderFooterViewReuseIdentifier: "ProfileHeaderTableStyle29")
        tableGallery.register(UINib(nibName: "GalleryStyle4Cell", bundle: nil), forCellReuseIdentifier: "GalleryStyle4Cell")
        self.view .addSubview(tableGallery)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProfileHeaderTableStyle29") as! ProfileHeaderTableStyle29
        cell.name.text = "Landscapes"
        cell.counter.text = "24 Photos"
        cell.backgroundColor = UIColor.white
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 250
        case 1:
            return 250
        default:
            return 250
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GalleryStyle4Cell", for: indexPath)as! GalleryStyle4Cell
            
            cell.img.downloadedFrom(link: "\(list[indexPath.row])", contentMode: .scaleAspectFill)
            cell.valueLove.text = "1347"
            cell.valueView.text = "19789"
            cell.valueTime.text = "An hour ago"
            cell.backgroundColor = UIColor.clear
            
            cell.index = indexPath as NSIndexPath
            cell.delegate = self
            return cell
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
    
    // ProfileHeaderStyle29Delegate
    func photos() {
        FunctionDefault.AlertMessage(title: "Photos", message: "", targetVC: self)
    }
    
    func stories() {
        FunctionDefault.AlertMessage(title: "Stories", message: "", targetVC: self)
    }
    
    func friens() {
        FunctionDefault.AlertMessage(title: "Friends", message: "", targetVC: self)
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
