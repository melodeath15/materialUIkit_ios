//
//  GalleryControllerStyle23.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/25/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class GalleryControllerStyle23: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, GalleryStyle1HeaderDelegate {

    var collection: UICollectionView!
    var header = GalleryStyle1Header()
    var cell = GalleryStyle23Cell()
    
    var list = NSArray()
    var name = NSArray()
    var tagName = NSArray()
    var count = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list = ["\(baseAssetGallery)Gallery-23-img-1.png", "\(baseAssetGallery)Gallery-23-img-2.png", "\(baseAssetGallery)Gallery-23-img-3.png", "\(baseAssetGallery)Gallery-23-img-4.png"]
        name = ["Workspaces", "Funky Bedroom", "White Stripes Girl", "Coffe, Bread & Pecans"]
        tagName = ["Desk, Interior, Workspaces", "Interior, Cabin", "Fashion, Instagram", "Food"]
        count = ["4", "4", "4", "4"]
        createView()
        
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.black
        
        // create header
        header = Bundle.main.loadNibNamed("GalleryStyle1Header", owner: nil, options: nil)?.first as! GalleryStyle1Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = "Portofolio"
        
        header.btnMenu.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        header.delegate = self
        self.view.addSubview(header)
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width/2, height: (self.view.frame.size.height-80)/2)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        collection = UICollectionView(frame: CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80), collectionViewLayout: layout)
        collection.backgroundColor = UIColor.clear
        collection.delegate = self
        collection.dataSource = self
        
        collection.setCollectionViewLayout(layout, animated: true)
        collection.register(UINib(nibName: "GalleryStyle23Cell", bundle:nil), forCellWithReuseIdentifier: "GalleryStyle23Cell")
        self.view.addSubview(collection)

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryStyle23Cell", for: indexPath) as! GalleryStyle23Cell
        
        cell.img.downloadedFrom(link: "\(list[indexPath.row])", contentMode: .scaleAspectFill)
        cell.title.text = "\(name[indexPath.row])"
        cell.tagLabel.text = "\(tagName[indexPath.row])"
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        FunctionDefault.AlertMessage(title: "\(name[indexPath.row])", message: "\(indexPath.row)", targetVC: self)
    }
    
    // GalleryStyle1HeaderDelegate
    func menu(){
        // not use
    }
    
    func search() {
        FunctionDefault.AlertMessage(title: "Search", message: "", targetVC: self)
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
