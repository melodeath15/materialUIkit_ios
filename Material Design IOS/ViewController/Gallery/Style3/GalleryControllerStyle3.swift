//
//  GalleryControllerStyle3.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/20/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class GalleryControllerStyle3: UIViewController, GalleryStyle1HeaderDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout, GalleryStyle3CellDelegate {
    
    var collMenu: UICollectionView!
    var header = GalleryStyle1Header()
    var cell = GalleryStyle3Cell()
    var list = NSArray()
    var name = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list = ["Gallery-3-img-1.png", "Gallery-3-img-2.png", "Gallery-3-img-3.png", "Gallery-3-img-4.png", "Gallery-3-img-5.png", "Gallery-3-img-6.png"]
        
        name = ["Workspaces", "Still Objects", "Funny Stuff", "Toys", "Fashion", "Women"]
        
        createView() // function for create header, create collectionview
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)

        // Create Header
        header = Bundle.main.loadNibNamed("GalleryStyle1Header", owner: nil, options: nil)?.first as! GalleryStyle1Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = "Wallpaper"
        header.btnMenu.setImage(UIImage(named: "back1"), for: .normal)
        
        header.delegate = self
        self.view.addSubview(header)
        
        // create collectionview
        let layout = CHTCollectionViewWaterfallLayout()
        layout.minimumColumnSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.columnCount = 2
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        
        collMenu = UICollectionView(frame: CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80), collectionViewLayout: layout)
        collMenu.autoresizingMask = [UIViewAutoresizing.flexibleHeight, UIViewAutoresizing.flexibleWidth]
        collMenu.alwaysBounceVertical = true
        collMenu.backgroundColor = UIColor.clear
        collMenu.delegate = self;
        collMenu.dataSource = self;
        
        // regis UINib GalleryStyle3Cell
        collMenu.setCollectionViewLayout(layout, animated: true)
        collMenu.register(UINib(nibName: "GalleryStyle3Cell", bundle:nil), forCellWithReuseIdentifier: "GalleryStyle3Cell")
        
        self.view.addSubview(collMenu)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let imageSize = UIImage(named: "\(list[indexPath.row])")?.size
        
        let w = imageSize?.width
        let h = (imageSize?.height)! + 200
        return CGSize(width: w!, height: h)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryStyle3Cell", for: indexPath) as! GalleryStyle3Cell
        
        cell.img.image = UIImage(named: "\(list[indexPath.row])")
        cell.title.text = "\(name[indexPath.row])"
        
        cell.btnOption.addTarget(self, action: #selector(pushOptionColl(index:)), for: .touchUpInside)
        
        cell.index = indexPath as NSIndexPath
        cell.delegate = self
        return cell
    }
    
    // GalleryStyle3CellDelegate
    func pushOptionColl(index: NSIndexPath) {
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
    
    func pushCell(index: NSIndexPath) {
        FunctionDefault.AlertMessage(title: "\(index.row)", message: "", targetVC: self)
    }
    // end
    
    // ViewActivityStyle1HeaderDelegate
    func menu() {// function for back layout
        navigationController?.popViewController(animated: true)
    }
    
    func search() {// function for search
        FunctionDefault.AlertMessage(title: "Search", message: "", targetVC: self)
    }
    
    func optional() {// function for menu option
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
