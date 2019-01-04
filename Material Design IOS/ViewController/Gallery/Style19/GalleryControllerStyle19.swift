//
//  GalleryControllerStyle19.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/25/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class GalleryControllerStyle19: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, GalleryStyle6HeaderDelegate, GalleryStyle19CellDelegate {

    var collection: UICollectionView!
    var header = GalleryStyle6Header()
    var cell = GalleryStyle19Cell()
    
    var list = NSArray()
    var countSelect = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list = [
            "\(baseAssetGallery)Gallery-19-img-1.png",
            "\(baseAssetGallery)Gallery-19-img-2.png",
            "\(baseAssetGallery)Gallery-19-img-3.png",
            "\(baseAssetGallery)Gallery-19-img-4.png",
            "\(baseAssetGallery)Gallery-19-img-5.png",
            "\(baseAssetGallery)Gallery-19-img-6.png",
            "\(baseAssetGallery)Gallery-19-img-7.png",
            "\(baseAssetGallery)Gallery-19-img-8.png"
        ]
        
        countSelect = 0
        createView()
        
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // create header
        header = Bundle.main.loadNibNamed("GalleryStyle6Header", owner: nil, options: nil)?.first as! GalleryStyle6Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
            
        header.btnMenu.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        header.delegate = self
        self.view.addSubview(header)
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width/3, height: UIScreen.main.bounds.size.width/3)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        collection = UICollectionView(frame: CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80), collectionViewLayout: layout)
        collection.backgroundColor = UIColor.clear
        collection.delegate = self
        collection.dataSource = self
        
        collection.setCollectionViewLayout(layout, animated: true)
        collection.register(UINib(nibName: "GalleryStyle19Cell", bundle:nil), forCellWithReuseIdentifier: "GalleryStyle19Cell")
        self.view.addSubview(collection)
    
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryStyle19Cell", for: indexPath) as! GalleryStyle19Cell

        cell.img.downloadedFrom(link: "\(list[indexPath.row])", contentMode: .scaleAspectFill)
        cell.delegate = self
        return cell
    }
    
    
    func pushCell(count: Int) {
        
        countSelect += count
        
        if countSelect > 0{
            header.title.text = "\(countSelect) Selected"
            header.btmShare.isHidden = false
            header.btnSearch.setImage(UIImage(named: "Gallery-11-icon-delete"), for: .normal)
        }else{
            header.title.text = "Gallery"
            header.btmShare.isHidden = true
            header.btnSearch.setImage(UIImage(named: "search1"), for: .normal)
        }
        
    }
    
    // GalleryStyle6HeaderDelegate
    func menu(){
        // not use
    }
    
    func search() {
        
        if countSelect > 0{
            FunctionDefault.AlertMessage(title: "Delete", message: "", targetVC: self)
        }else{
            FunctionDefault.AlertMessage(title: "Search", message: "", targetVC: self)
        }
    }
    
    func share() {
        FunctionDefault.AlertMessage(title: "Share", message: "", targetVC: self)
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
