//
//  GalleryControllerStyle8Tap1.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/1/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class GalleryControllerStyle8Tap1: UIViewController, IndicatorInfoProvider, UITableViewDelegate, UITableViewDataSource, GalleryStyle7CollectionDelegate {

    var itemInfo: IndicatorInfo = "View"
    var collection: UICollectionView!
    var tableGallery = UITableView()
    var header = GalleryStyle6Header()
    
    var listName = NSArray()
    var list1 = NSArray()
    var list2 = NSArray()
    var selected = Int()
    
    init(itemInfo: IndicatorInfo) {
        self.itemInfo = itemInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listName = ["RECENT VIDEO", "LAST WEEK"]
        list1 = [
            "\(baseAssetGallery)Gallery-8-img-1.png",
            "\(baseAssetGallery)Gallery-8-img-2.png",
            "\(baseAssetGallery)Gallery-8-img-3.png",
            "\(baseAssetGallery)Gallery-8-img-4.png",
            "\(baseAssetGallery)Gallery-8-img-5.png",
            "\(baseAssetGallery)Gallery-8-img-6.png"
        ]
        
        list2 = [
            "\(baseAssetGallery)Gallery-1-img-8.png",
            "\(baseAssetGallery)Gallery-1-img-9.png",
            "\(baseAssetGallery)Gallery-1-img-10.png",
            "\(baseAssetGallery)Gallery-1-img-11.png",
            "\(baseAssetGallery)Gallery-1-img-1.png",
            "\(baseAssetGallery)Gallery-1-img-11.png",
            "\(baseAssetGallery)Gallery-1-img-1.png"
        ]

        createView()
        
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: self.view.frame.size.width/3-5, height: 50)
        layout.scrollDirection = .horizontal
        
        // create table
        tableGallery.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height-120)
        tableGallery.delegate = self;
        tableGallery.dataSource = self;
        tableGallery.backgroundColor = UIColor.clear
        tableGallery.separatorColor = UIColor.clear
        tableGallery.allowsSelection = false
        
        // register UINib for GalleryStyle1Collection
        tableGallery.register(UINib(nibName: "GalleryStyle7Collection", bundle: nil), forCellReuseIdentifier: "GalleryStyle7Collection")
        self.view .addSubview(tableGallery)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listName.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            let total = Double(list1.count)
            let collume = Double(3.0)
            let collAll = ceil(total/collume)
            
            return CGFloat((Double(self.view.frame.size.width/4) * collAll) + 100)
        }else{
            let total = Double(list2.count)
            let collume = Double(3.0)
            let collAll = ceil(total/collume)
            
            return CGFloat((Double(self.view.frame.size.width/4) * collAll) + 100)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GalleryStyle7Collection", for: indexPath)as! GalleryStyle7Collection
        
        cell.title.text = listName[indexPath.row] as? String
        
        if indexPath.row == 0 {
            cell.data = list1
        }else{
            cell.data = list2
        }
        
        let layout = UICollectionViewFlowLayout()
        
        if UIScreen.main.bounds.size.height == 568{
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            layout.itemSize = CGSize(width: self.view.frame.size.width/4, height: self.view.frame.size.width/4)
        }else{
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            layout.itemSize = CGSize(width: self.view.frame.size.width/3.9, height: self.view.frame.size.width/3.9)
        }
        
        cell.collectionImg.setCollectionViewLayout(layout, animated: true)
        cell.collectionImg.register(UINib(nibName: "GalleryStyle7Cell", bundle:nil), forCellWithReuseIdentifier: "GalleryStyle7Cell")
        
        cell.collectionImg.tag = indexPath.row
        cell.pageGallery = 8
        cell.delegate = self
        return cell
    }
    
    // GalleryStyle7CollectionDelegate
    func pushCellSelect(tag: Int, count: Int, data: NSArray) {
        // not use
    }
    
    func pushCell(tag: Int, index: Int, data: NSArray) {
        FunctionDefault.AlertMessage(title: "\(listName[tag])", message: "\(index) Name = \(data[index])", targetVC: self)
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
