//
//  EcommerceControllerStyle1Tap1.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/2/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceControllerStyle1Tap1: UIViewController, IndicatorInfoProvider, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, EcommerceStyle1HeaderImgDelegate {
    
    var itemInfo: IndicatorInfo = "View"
    var collection: UICollectionView!
    
    var listImg = NSArray()
    
    init(itemInfo: IndicatorInfo) {
        self.itemInfo = itemInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listImg = ["Ecommerce-1-img-post-1", "Ecommerce-1-img-post-2", "Ecommerce-1-img-post-3", "Ecommerce-1-img-post-4"]
        createView()
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: self.view.frame.size.width/2, height: self.view.frame.size.height/2.5)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height-120), collectionViewLayout: layout)
        collection.backgroundColor = UIColor.clear
        collection.delegate = self
        collection.dataSource = self
        
        collection.setCollectionViewLayout(layout, animated: true)
        collection.register(UINib(nibName: "EcommerceStyle1HeaderImg", bundle:nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "EcommerceStyle1HeaderImg")
        collection.register(UINib(nibName: "EcommerceStyle1Cell", bundle:nil), forCellWithReuseIdentifier: "EcommerceStyle1Cell")
        self.view.addSubview(collection)
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height/2.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "EcommerceStyle1HeaderImg", for: indexPath) as! EcommerceStyle1HeaderImg
        
        headerCell.yearhCollection.text = "2016 COLLECTION"
        headerCell.title.text = "ZARA WOMEN DRESS"
        
        headerCell.delegate = self
        return headerCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EcommerceStyle1Cell", for: indexPath) as! EcommerceStyle1Cell
        
        cell.img.image = UIImage(named: "\(listImg[indexPath.row])")
        cell.title.text = "Sky Blue Dress"
        cell.price.text = "$225"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        FunctionDefault.AlertMessage(title: "\(indexPath.row)", message: "", targetVC: self)
    }
    
    // EcommerceStyle1HeaderImgDelegate
    func shopNow() {
        FunctionDefault.AlertMessage(title: "Shop Now", message: "", targetVC: self)
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
