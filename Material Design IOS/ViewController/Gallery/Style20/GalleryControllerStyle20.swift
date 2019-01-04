//
//  GalleryControllerStyle20.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/25/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class GalleryControllerStyle20: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, GalleryStyle6HeaderDelegate, GalleryStyle19CellDelegate, CHTCollectionViewDelegateWaterfallLayout {

    var collection: UICollectionView!
    var header = GalleryStyle6Header()
    var cell = GalleryStyle19Cell()
    
    var list = NSArray()
    var countSelect = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list = ["Gallery-20-img-1.png", "Gallery-20-img-2.png", "Gallery-20-img-3.png", "Gallery-20-img-4.png", "Gallery-20-img-5.png", "Gallery-20-img-6.png"]
        
        countSelect = 0
        createView()
        
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.white
        
        // create header
        header = Bundle.main.loadNibNamed("GalleryStyle6Header", owner: nil, options: nil)?.first as! GalleryStyle6Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        
        header.btnMenu.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        header.delegate = self
        self.view.addSubview(header)
        
        let layout = CHTCollectionViewWaterfallLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumColumnSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.columnCount = 2
        
        collection = UICollectionView(frame: CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80), collectionViewLayout: layout)
        collection.autoresizingMask = [UIViewAutoresizing.flexibleHeight, UIViewAutoresizing.flexibleWidth]
        collection.alwaysBounceVertical = true
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
        
        cell.img.image = UIImage(named: "\(list[indexPath.row])")
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let imageSize = UIImage(named: "\(list[indexPath.row])")?.size
        let w = imageSize?.width
        let h = (imageSize?.height)!
        
        return CGSize(width: w!, height: h)
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
