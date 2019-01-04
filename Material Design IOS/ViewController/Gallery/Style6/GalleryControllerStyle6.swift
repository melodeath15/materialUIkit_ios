//
//  GalleryControllerStyle6.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/21/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class GalleryControllerStyle6: UIViewController, UITableViewDelegate, UITableViewDataSource, GalleryStyle6HeaderDelegate, GallerySyle6CollectionDelegate{

    var tableGallery = UITableView()
    var header = GalleryStyle6Header()
    
    var listName = NSArray()
    var list1 = NSArray()
    var list2 = NSArray()
    var selected = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listName = ["Minimal Interior", "Women"]
        list1 = [
            "\(baseAssetGallery)Gallery-6-img-1.png",
            "\(baseAssetGallery)Gallery-6-img-2.png",
            "\(baseAssetGallery)Gallery-6-img-3.png",
            "\(baseAssetGallery)Gallery-6-img-4.png",
            "\(baseAssetGallery)Gallery-6-img-5.png",
            "\(baseAssetGallery)Gallery-6-img-1.png",
            "\(baseAssetGallery)Gallery-6-img-1.png",
            "\(baseAssetGallery)Gallery-6-img-2.png",
            "\(baseAssetGallery)Gallery-6-img-3.png"
        ]
       
        list2 = [
            "\(baseAssetGallery)Gallery-6-img-7.png",
            "\(baseAssetGallery)Gallery-6-img-8.png",
            "\(baseAssetGallery)Gallery-6-img-9.png",
            "\(baseAssetGallery)Gallery-6-img-10.png",
            "\(baseAssetGallery)Gallery-6-img-11.png",
            "\(baseAssetGallery)Gallery-6-img-7.png",
            "\(baseAssetGallery)Gallery-6-img-7.png",
            "\(baseAssetGallery)Gallery-6-img-8.png",
            "\(baseAssetGallery)Gallery-6-img-9.png",
            "\(baseAssetGallery)Gallery-6-img-10.png"
        ]
        
        createView()
        
    }
    
    func createView(){
        // create header
        header = Bundle.main.loadNibNamed("GalleryStyle6Header", owner: nil, options: nil)?.first as! GalleryStyle6Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        
        header.btnMenu.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        header.delegate = self
        self.view.addSubview(header)
        
        // create table
        tableGallery.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80)
        tableGallery.delegate = self;
        tableGallery.dataSource = self;
        tableGallery.backgroundColor = UIColor.clear
        tableGallery.separatorColor = UIColor.clear
        tableGallery.allowsSelection = false
        
        // register UINib for GalleryStyle1Collection
        tableGallery.register(UINib(nibName: "GallerySyle6Collection", bundle: nil), forCellReuseIdentifier: "GallerySyle6Collection")
        self.view .addSubview(tableGallery)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listName.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if list1.count > 5 {
            return (UIScreen.main.bounds.size.width/4 * 2) + 100
        }else{
            return (UIScreen.main.bounds.size.width/4) + 100
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GallerySyle6Collection", for: indexPath)as! GallerySyle6Collection
        
        cell.title.text = listName[indexPath.row] as? String

        if indexPath.row == 0 {
            cell.data = list1
            cell.countImg.text = "\(list1.count) Photos"
        }else{
            cell.data = list2
            cell.countImg.text = "\(list2.count) Photos"
        }
        
        let layout = UICollectionViewFlowLayout()
        
        if UIScreen.main.bounds.size.height == 568{
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            layout.itemSize = CGSize(width: self.view.frame.size.width/4, height: self.view.frame.size.width/4)
        }else{
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            layout.itemSize = CGSize(width: self.view.frame.size.width/3.9, height: self.view.frame.size.width/3.9)
        }
                
        cell.collImg.setCollectionViewLayout(layout, animated: true)
        cell.collImg.register(UINib(nibName: "GalleryStyle6Cell", bundle:nil), forCellWithReuseIdentifier: "GalleryStyle6Cell")
        cell.collImg.tag = indexPath.row
        cell.delegate = self
        
        return cell
    }
    
    func pushCellSelect(tag: Int, count: Int, data: NSArray) {
        
        selected += count
        
        if selected > 0{
            header.title.text = "\(selected) Selected"
            header.btmShare.isHidden = false
            header.btnSearch.setImage(UIImage(named: "Gallery-11-icon-delete"), for: .normal)
        }else{
            header.title.text = "Gallery"
            header.btmShare.isHidden = true
            header.btnSearch.setImage(UIImage(named: "search1"), for: .normal)
        }
            
    }
    
    func showAll(tag: Int) {
        FunctionDefault.AlertMessage(title: "\(listName[tag])", message: "Show All", targetVC: self)
    }
    
    // GalleryStyle6HeaderDelegate
    func share() {
        FunctionDefault.AlertMessage(title: "Share", message: "", targetVC: self)
    }
    
    func menu() {
        // not use
    }
    
    func search() {
        if selected > 0{
            FunctionDefault.AlertMessage(title: "Delete", message: "", targetVC: self)
        }else{
            FunctionDefault.AlertMessage(title: "Search", message: "", targetVC: self)
        }
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
