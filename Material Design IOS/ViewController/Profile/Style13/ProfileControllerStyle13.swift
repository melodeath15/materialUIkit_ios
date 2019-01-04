//
//  ProfileControllerStyle13.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 10/31/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ProfileControllerStyle13: UIViewController, IndicatorInfoProvider, UITableViewDelegate, UITableViewDataSource, ProfileHeaderCellStyle13Delegate, ProfileCellStyle13Delegate {
    
    var itemInfo: IndicatorInfo = "PROFILE"

    var tableGallery = UITableView()
    var listName = NSArray()
    var list1 = NSArray()

    init(itemInfo: IndicatorInfo) {
        self.itemInfo = itemInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listName = ["Photos"]
        list1 = [
            "\(baseAssetGallery)Gallery-1-img-1.png",
            "\(baseAssetGallery)Gallery-1-img-2.png",
            "\(baseAssetGallery)Gallery-1-img-3.png",
            "\(baseAssetGallery)Gallery-1-img-4.png",
            "\(baseAssetGallery)Gallery-1-img-6.png",
            "\(baseAssetGallery)Gallery-1-img-1.png",
            "\(baseAssetGallery)Gallery-1-img-2.png",
            "\(baseAssetGallery)Gallery-1-img-3.png",
            "\(baseAssetGallery)Gallery-1-img-4.png",
            "\(baseAssetGallery)Gallery-1-img-6.png",
            "\(baseAssetGallery)Gallery-1-img-1.png",
            "\(baseAssetGallery)Gallery-1-img-2.png",
            "\(baseAssetGallery)Gallery-1-img-3.png",
            "\(baseAssetGallery)Gallery-1-img-4.png",
            "\(baseAssetGallery)Gallery-1-img-6.png"
        ]
        
        createView()
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 241/255.0, green: 246/255.0, blue: 248/255.0, alpha: 1)
        
        // create table
        tableGallery.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height-120)
        tableGallery.delegate = self;
        tableGallery.dataSource = self;
        tableGallery.backgroundColor = UIColor.clear
        tableGallery.separatorColor = UIColor.clear
        tableGallery.allowsSelection = false
        
        // register UINib for ProfileCellStyle13
        tableGallery.register(UINib(nibName: "ProfileHeaderCellStyle13", bundle: nil), forCellReuseIdentifier: "ProfileHeaderCellStyle13")
        tableGallery.register(UINib(nibName: "ProfileCellStyle13", bundle: nil), forCellReuseIdentifier: "ProfileCellStyle13")
        self.view .addSubview(tableGallery)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listName.count + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 150
        }else{
            let total = Double(list1.count)
            let coll = Double(3.0)
            let totoalColl = ceil(total/coll)
            return CGFloat(totoalColl) * (self.view.frame.size.width/4 ) + 180
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row != 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCellStyle13", for: indexPath)as! ProfileCellStyle13
            
            cell.title.text = listName[indexPath.row-1] as? String
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
            cell.collectionImg.register(UINib(nibName: "ProfileImgCellStyle13", bundle:nil), forCellWithReuseIdentifier: "ProfileImgCellStyle13")
            cell.collectionImg.tag = indexPath.row-1
            cell.collectionImg.isScrollEnabled = false
            
            cell.delegate = self
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileHeaderCellStyle13", for: indexPath)as! ProfileHeaderCellStyle13
            
            cell.name.text = "James Richardson"
            cell.ciy.text = "San Fransisco, CA"
            cell.valuePhotos.text = "56"
            cell.valueStories.text = "14"
            cell.valueFriends.text = "136"
            
            cell.delegate = self
            return cell
        }
    }
    
    // ProfileHeaderCellStyle13Delegate
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
    
    // ProfileCellStyle13Delegate
    func pushCell(tag: Int, index: IndexPath, data: NSArray) {
        FunctionDefault.AlertMessage(title: "\(listName[tag])", message: "\(index) Name = \(data[index.row])", targetVC: self)
    }
    
    func plush() {
        FunctionDefault.AlertMessage(title: "Plush", message: "", targetVC: self)
    }
    
    func share() {
        FunctionDefault.AlertMessage(title: "Share", message: "", targetVC: self)
    }
    
    func love() {
        FunctionDefault.AlertMessage(title: "Love", message: "", targetVC: self)
    }
    // end
    
    // IndicatorInfoProvider
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
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
