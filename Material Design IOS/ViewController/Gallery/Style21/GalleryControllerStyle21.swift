//
//  GalleryControllerStyle21.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/25/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class GalleryControllerStyle21: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, GalleryStyle1HeaderDelegate, CHTCollectionViewDelegateWaterfallLayout {

    var collection: UICollectionView!
    var header = GalleryStyle1Header()
    var cell = GalleryStyle21Cell()
    
    var list = NSArray()
    var countSelect = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list = ["Gallery-21-img-1", "Gallery-21-img-2", "Gallery-21-img-3"]
        countSelect = 0
        createView()
        
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.white
        
        // create header
        header = Bundle.main.loadNibNamed("GalleryStyle1Header", owner: nil, options: nil)?.first as! GalleryStyle1Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = "Cinnamons"
        header.btnMenu.setImage(UIImage(named: "back1"), for: .normal)
        header.btnSearch.isHidden = true
        header.delegate = self
        self.view.addSubview(header)
        
        let layout = CHTCollectionViewWaterfallLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumColumnSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.columnCount = 1
        
        collection = UICollectionView(frame: CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80), collectionViewLayout: layout)
        collection.autoresizingMask = [UIViewAutoresizing.flexibleHeight, UIViewAutoresizing.flexibleWidth]
        collection.backgroundColor = UIColor.clear
        collection.delegate = self
        collection.dataSource = self
        
        collection.setCollectionViewLayout(layout, animated: true)
        collection.register(UINib(nibName: "GalleryStyle21Cell", bundle:nil), forCellWithReuseIdentifier: "GalleryStyle21Cell")
        self.view.addSubview(collection)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let imageSize = UIImage(named: "\(list[indexPath.row])")?.size
        let w = imageSize?.width
        let h = (imageSize?.height)!
        
        return CGSize(width: w!, height: h)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryStyle21Cell", for: indexPath) as! GalleryStyle21Cell
        
        cell.img.image = UIImage(named: "\(list[indexPath.row])")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        FunctionDefault.AlertMessage(title: "\(indexPath.row)", message: "", targetVC: self)
    }
    
    // GalleryStyle1HeaderDelegate
    func menu(){
        navigationController?.popViewController(animated: true)
    }
    
    func search() {
        // not use
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
