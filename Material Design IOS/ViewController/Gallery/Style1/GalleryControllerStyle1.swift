//
//  GalleryControllerStyle1.swift
//  Material Design IOS
//
//  Created by Denis Titra Prada on 7/19/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class GalleryControllerStyle1: UIViewController, UITableViewDelegate, UITableViewDataSource, GalleryStyle1HeaderDelegate, GalleryStyle1CollectionDelegate{
    
    var tableGallery = UITableView()
    var header = GalleryStyle1Header()
    
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
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // create header
        header = Bundle.main.loadNibNamed("GalleryStyle1Header", owner: nil, options: nil)?.first as! GalleryStyle1Header
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
        tableGallery.register(UINib(nibName: "GalleryStyle1Collection", bundle: nil), forCellReuseIdentifier: "GalleryStyle1Collection")
        self.view .addSubview(tableGallery)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listName.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if list1.count > 5 {
            return (self.view.frame.size.width/4 * 2) + 80
        }else{
            return (self.view.frame.size.width/4) + 80
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GalleryStyle1Collection", for: indexPath)as! GalleryStyle1Collection
        
        cell.title.text = listName[indexPath.row] as? String
        
        if indexPath.row == 0 {
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
        cell.collectionImg.tag = indexPath.row
        cell.collectionImg.isScrollEnabled = false
        
        cell.delegate = self
        return cell
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
    
    // GalleryStyle6HeaderDelegate
    func share() {
        FunctionDefault.AlertMessage(title: "Share", message: "", targetVC: self)
    }
    
    func menu() {
        // not use
    }
    
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
