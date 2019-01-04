//
//  EcommerceControllerStyle3.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/3/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceControllerStyle3: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, EcommerceStyle1HeaderDelegate {
    
    var collection: UICollectionView!
    var header = EcommerceStyle1Header()
    var headerCatalog = EcommerceStyle3View()

    var listImg = NSArray()
    var listName = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        listImg = ["Ecommerce-3-img-1", "Ecommerce-3-img-2", "Ecommerce-3-img-3", "Ecommerce-3-img-4", "Ecommerce-3-img-5", "Ecommerce-3-img-6"]
        listName = ["Sky Blue Dress", "Sky Blue Dress", "Zara Jumpsuit Dress", "Black Faux Leather", "Sky Blue Dress", "Sky Blue Dress"]
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
        headerCatalog.titleHidden.text = "Catalog/"
        headerCatalog.titleActive.text = "Women"
        self.view.addSubview(headerCatalog)
        
        // create collectionview
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: self.view.frame.size.width/2, height: self.view.frame.size.height/2.5)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        collection = UICollectionView(frame: CGRect(x: 0, y: 110, width: self.view.frame.size.width, height: self.view.frame.size.height-110), collectionViewLayout: layout)
        collection.backgroundColor = UIColor.clear
        collection.delegate = self
        collection.dataSource = self
        
        collection.setCollectionViewLayout(layout, animated: true)
        collection.register(UINib(nibName: "EcommerceStyle1Cell", bundle:nil), forCellWithReuseIdentifier: "EcommerceStyle1Cell")
        self.view.addSubview(collection)

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EcommerceStyle1Cell", for: indexPath) as! EcommerceStyle1Cell
        
        cell.img.image = UIImage(named: "\(listImg[indexPath.row])")
        cell.title.text = "\(listName[indexPath.row])"
        cell.price.text = "$225"
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
