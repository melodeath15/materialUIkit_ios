//
//  EcommerceControllerStyle6.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/3/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceControllerStyle6: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, CHTCollectionViewDelegateWaterfallLayout, EcommerceStyle1HeaderDelegate {

    var collection: UICollectionView!
    var header = EcommerceStyle1Header()
    var headerCatalog = EcommerceStyle3View()
    
    var listImg = NSArray()
    var listName = NSArray()
    var listCount = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listImg = ["Ecommerce-6-img-1", "Ecommerce-6-img-2", "Ecommerce-6-img-4", "Ecommerce-6-img-3"]
        listName = ["Dress", "Shoes", "Bag & Purse", "Hat"]
        listCount = ["32", "250", "250", "32"]
        createView()
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // create header
        header = Bundle.main.loadNibNamed("EcommerceStyle1Header", owner: nil, options: nil)?.first as! EcommerceStyle1Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = "Ecommerce"
        header.btnMenu.setImage(UIImage(named: "back1"), for: .normal)
        header.delegate = self
        self.view.addSubview(header)
        
        // create headerCatalog
        headerCatalog = Bundle.main.loadNibNamed("EcommerceStyle3View", owner: nil, options: nil)?.first as! EcommerceStyle3View
        headerCatalog.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: 30)
        headerCatalog.titleHidden.text = "New Arrival/"
        headerCatalog.titleActive.text = "Apparel"
        self.view.addSubview(headerCatalog)
        
        // create collectionview
        let layout = CHTCollectionViewWaterfallLayout()
        layout.minimumColumnSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.columnCount = 2
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        collection = UICollectionView(frame: CGRect(x: 0, y: 110, width: self.view.frame.size.width, height: self.view.frame.size.height-110), collectionViewLayout: layout)
        collection.autoresizingMask = [UIViewAutoresizing.flexibleHeight, UIViewAutoresizing.flexibleWidth]
        collection.alwaysBounceVertical = true
        collection.backgroundColor = UIColor.clear
        collection.delegate = self;
        collection.dataSource = self;
        
        // regis UINib GalleryStyle3Cell
        collection.setCollectionViewLayout(layout, animated: true)
        collection.register(UINib(nibName: "EcommerceStyle6Cell", bundle:nil), forCellWithReuseIdentifier: "EcommerceStyle6Cell")
        self.view.addSubview(collection)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let imageSize = UIImage(named: "\(listImg[indexPath.row])")?.size
        let w = imageSize?.width
        let h = (imageSize?.height)! + 200
        
        return CGSize(width: w!, height: h)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EcommerceStyle6Cell", for: indexPath) as! EcommerceStyle6Cell
        
        cell.img.image = UIImage(named: "\(listImg[indexPath.row])")
        cell.title.text = "\(listName[indexPath.row])"
        cell.value.text = "\(listCount[indexPath.row])"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        FunctionDefault.AlertMessage(title: "\(listName[indexPath.row])", message: "\(indexPath.row)", targetVC: self)
    }
    
    // EcommerceStyle1HeaderDelegate
    func menu() {
        navigationController?.popViewController(animated: true)
    }
    
    func buy(){
        FunctionDefault.AlertMessage(title: "Buy", message: "", targetVC: self)
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
