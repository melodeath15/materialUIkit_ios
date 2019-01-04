//
//  GalleryControllerStyle2.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/20/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class GalleryControllerStyle2: UIViewController, UITableViewDelegate, UITableViewDataSource, GalleryStyle1HeaderDelegate, GalleryStyle2CellBigDelegate {

    var tableGallery = UITableView()
    var collection: UICollectionView!
    var header = GalleryStyle1Header()
    var cellImg = GalleryStyle2CellBig()
    
    var listName = NSArray()
    var list1 = NSArray()
    var list2 = NSArray()
    var list3 = NSArray()
    var data = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listName = ["Landscapes", "Urban City", "Nature"]
        list1 = ["\(baseAssetGallery)Gallery-2-img-1.png", "\(baseAssetGallery)Gallery-2-img-2.png"]
        list2 = ["\(baseAssetGallery)Gallery-2-img-3.png", "\(baseAssetGallery)Gallery-2-img-4.png", "\(baseAssetGallery)Gallery-2-img-5.png"]
        list3 = ["\(baseAssetGallery)Gallery-2-img-6.png"]
        
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
        tableGallery.register(UINib(nibName: "GalleryStyle2CellBig", bundle: nil), forCellReuseIdentifier: "GalleryStyle2CellBig")
        self.view .addSubview(tableGallery)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listName.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return self.view.frame.size.width/2 + 60
        }else{
            return self.view.frame.size.width/2 + 20
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cellImg = tableView.dequeueReusableCell(withIdentifier: "GalleryStyle2CellBig", for: indexPath)as! GalleryStyle2CellBig
        
        if indexPath.row == 0{
        
            cellImg.data = list1
        
            let layout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            layout.itemSize = CGSize(width: self.view.frame.size.width/2+50, height: self.view.frame.size.width/3+50)
            layout.scrollDirection = .horizontal
        
            cellImg.collectionView.setCollectionViewLayout(layout, animated: true)
            cellImg.count.text = "\(list1.count) Photos"
            
        }else if indexPath.row == 1{
        
            cellImg.data = list2
            
            let layout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            layout.itemSize = CGSize(width: self.view.frame.size.width/2.5, height: self.view.frame.size.width/3)
            layout.scrollDirection = .horizontal
            
            cellImg.collectionView.setCollectionViewLayout(layout, animated: true)
            cellImg.count.text = "\(list2.count) Photos"
            
        }else if indexPath.row == 2{
        
            cellImg.data = list3
            
            let layout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            layout.itemSize = CGSize(width: self.view.frame.size.width/1 - 20, height: self.view.frame.size.width/2)
            layout.scrollDirection = .horizontal
            
            cellImg.collectionView.setCollectionViewLayout(layout, animated: true)
            cellImg.count.text = "\(list3.count) Photos"

        }
        
        cellImg.collectionView.register(UINib(nibName: "GalleryStyle2Cell", bundle:nil), forCellWithReuseIdentifier: "GalleryStyle2Cell")
        cellImg.collectionView.tag = indexPath.row
        
        cellImg.title.text = "\(listName[indexPath.row])"
        cellImg.delegate = self
        return cellImg
    }
    
    // GalleryStyle2CellBigDelegate
    func pushCell(tag: Int, index: Int, data: NSArray) {
        FunctionDefault.AlertMessage(title: "\(listName[tag])", message: "\(index) Name = \(data[index])", targetVC: self)
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
