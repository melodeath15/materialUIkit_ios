//
//  EcommerceControllerStyle4.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/3/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceControllerStyle4: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, EcommerceStyle1HeaderDelegate {

    var collection: UICollectionView!
    var header = EcommerceStyle1Header()
    var headerCatalog = EcommerceStyle3View()
    
    var listSection = NSArray()
    var listImg1 = NSArray()
    var listImg2 = NSArray()
    var listName1 = NSArray()
    var listName2 = NSArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        listSection = ["Women Dress", "Women Shoes"]
        listImg1 = ["Ecommerce-3-img-3", "Ecommerce-3-img-4", "Ecommerce-3-img-6", "Ecommerce-3-img-1"]
        listImg2 = ["Ecommerce-4-img-1", "Ecommerce-4-img-2", "Ecommerce-4-img-3", "Ecommerce-4-img-4"]
        listName1 = ["Zara Jumpsuit Dress", "Black Faux Leather", "Sky Blue Dress", "Sky Blue Dress"]
        listName2 = ["Burgundy Ankle Boot", "High Heel Pointed", "Zara Sneakers", "Black Faux Hight Heel"]
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
        
        // create collectionview
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: self.view.frame.size.width/2, height: self.view.frame.size.height/2.5)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        collection = UICollectionView(frame: CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80), collectionViewLayout: layout)
        collection.backgroundColor = UIColor.clear
        collection.delegate = self
        collection.dataSource = self
        
        collection.setCollectionViewLayout(layout, animated: true)
        collection.register(UINib(nibName: "EcommerceStyle4HeaderCell", bundle:nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "EcommerceStyle4HeaderCell")
        collection.register(UINib(nibName: "EcommerceStyle1Cell", bundle:nil), forCellWithReuseIdentifier: "EcommerceStyle1Cell")
        self.view.addSubview(collection)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: 40)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return listSection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "EcommerceStyle4HeaderCell", for: indexPath) as! EcommerceStyle4HeaderCell

        headerCell.title.text = "\(listSection[indexPath.section])"
        headerCell.count.text = "24 Items >"
        
        return headerCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return listImg1.count
        }else{
            return listImg2.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EcommerceStyle1Cell", for: indexPath) as! EcommerceStyle1Cell
        
        if indexPath.section == 0 {
            cell.img.image = UIImage(named: "\(listImg1[indexPath.row])")
            cell.title.text = "\(listName1[indexPath.row])"
        }else{
            cell.img.image = UIImage(named: "\(listImg2[indexPath.row])")
            cell.title.text = "\(listName2[indexPath.row])"
        }
        
        cell.price.text = "$225"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.section == 0{
            FunctionDefault.AlertMessage(title: "\(listName1[indexPath.row])", message: "\(indexPath.row)", targetVC: self)
        }else{
            FunctionDefault.AlertMessage(title: "\(listName2[indexPath.row])", message: "\(indexPath.row)", targetVC: self)
        }
        
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
