//
//  GalleryContollerStyle14Tap1.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/1/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class GalleryContollerStyle14Tap1: UIViewController, IndicatorInfoProvider, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var itemInfo: IndicatorInfo = "View"
    var collection: UICollectionView!

    init(itemInfo: IndicatorInfo) {
        self.itemInfo = itemInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var name = NSArray()
    var img = NSArray()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        img = [
            "\(baseAssetGallery)Gallery-14-img-1.jpg",
            "\(baseAssetGallery)Gallery-14-img-2.png",
            "\(baseAssetGallery)Gallery-14-img-3.png",
            "\(baseAssetGallery)Gallery-14-img-4.png",
            "\(baseAssetGallery)Gallery-14-img-5.png",
            "\(baseAssetGallery)Gallery-14-img-6.png"
        ]
        
        name = ["Book Shelf", "Bedroom", "Furniture", "Objects", "Book Shelf", "Bedroom"]
        
        createView() // function for create header, create collectionview
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // Create collection
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: self.view.frame.size.width/2.3+5, height: self.view.frame.size.height/3)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height-120), collectionViewLayout: layout)
        collection.backgroundColor = UIColor.clear
        collection.delegate = self
        collection.dataSource = self
        
        collection.setCollectionViewLayout(layout, animated: true)
        collection.register(UINib(nibName: "GalleryStyle14Cell", bundle:nil), forCellWithReuseIdentifier: "GalleryStyle14Cell")
        self.view.addSubview(collection)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return img.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryStyle14Cell", for: indexPath) as! GalleryStyle14Cell
        
        cell.img.downloadedFrom(link: "\(img[indexPath.row])", contentMode: .scaleAspectFill)
        cell.title.text = "\(name[indexPath.row])"
        cell.valueLove.text = "1347"
        cell.valueView.text = "19789"
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        FunctionDefault.AlertMessage(title: "\(name[indexPath.row])", message: "", targetVC: self)
    }
    
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
