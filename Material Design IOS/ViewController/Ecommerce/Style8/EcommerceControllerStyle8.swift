//
//  EcommerceControllerStyle8.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/3/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceControllerStyle8: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, EcommerceStyle1HeaderDelegate, EcommerceStyle8HeaderCellDelegate {
    
    var collection: UICollectionView!
    var header = EcommerceStyle1Header()
    var headerCatalog = EcommerceStyle3View()
    
    var listImg = NSArray()
    var listName = NSArray()
    var listSection = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listImg = ["Ecommerce-8-img-2", "Ecommerce-8-img-3", "Ecommerce-8-img-4", "Ecommerce-8-img-5"]
        listName = ["Zara Jumpsuit Dress", "Black Faux Leather", "Zara Jumpsuit Dress", "Black Faux Leather"]
        listSection = ["Women Dress"]
        createView()
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // create header
        header = Bundle.main.loadNibNamed("EcommerceStyle1Header", owner: nil, options: nil)?.first as! EcommerceStyle1Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = "New Arrival"
        header.btnMenu.setImage(UIImage(named: "back1"), for: .normal)
        header.delegate = self
        self.view.addSubview(header)
        
        // create collectionview
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: self.view.frame.size.width/2.2, height: self.view.frame.size.height/2.5)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        
        collection = UICollectionView(frame: CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80), collectionViewLayout: layout)
        collection.backgroundColor = UIColor.clear
        collection.delegate = self
        collection.dataSource = self
        
        collection.setCollectionViewLayout(layout, animated: true)
        collection.register(UINib(nibName: "EcommerceStyle8HeaderCell", bundle:nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "EcommerceStyle8HeaderCell")
        collection.register(UINib(nibName: "EcommerceStyle8Cell", bundle:nil), forCellWithReuseIdentifier: "EcommerceStyle8Cell")
        self.view.addSubview(collection)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height/2.5)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return listSection.count
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "EcommerceStyle8HeaderCell", for: indexPath) as! EcommerceStyle8HeaderCell
        
        headerCell.titleCategory.text = "\(listSection[indexPath.section])"
        headerCell.countImg.text = "24 Items >"
        headerCell.catalog.text = "NEW ARRIVAL"
        headerCell.title.text = "Autumn Dress"
        headerCell.index = indexPath as NSIndexPath
        headerCell.delegate = self
        return headerCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return listImg.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EcommerceStyle8Cell", for: indexPath) as! EcommerceStyle8Cell
        
        cell.img.image = UIImage(named: "\(listImg[indexPath.row])")
        cell.title.text = "\(listName[indexPath.row])"
        cell.rating.value = 4
        cell.price.text = "$225"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        FunctionDefault.AlertMessage(title: "\(listName[indexPath.row])", message: "\(indexPath.row)", targetVC: self)
    }
    
    // EcommerceStyle8HeaderCellDelegate
    func shopNow(index: NSIndexPath) {
        FunctionDefault.AlertMessage(title: "Buy Now", message: "", targetVC: self)
    }
    // end
    
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
