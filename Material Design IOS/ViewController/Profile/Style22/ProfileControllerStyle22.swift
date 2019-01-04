//
//  ProfileControllerStyle22.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 10/31/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ProfileControllerStyle22: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, ProfileHeaderDelegate, CHTCollectionViewDelegateWaterfallLayout, ProfileCollectionMenuStyle19Delegate, GalleryStyle3CellDelegate, ProfileFooterStyle3Delegate {
    
    var collMenu: UICollectionView!
    var header = ProfileHeader()
    var headerCell = ProfileCellPhotoStyle21()
    var tap = ProfileCollectionMenuStyle19()
    var footer = ProfileFooterStyle3()
    var cell = GalleryStyle3Cell()
    var list = NSArray()
    var name = NSArray()
    var status = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list = ["Gallery-3-img-1.png", "Gallery-3-img-2.png", "Gallery-3-img-3.png", "Gallery-3-img-4.png", "Gallery-3-img-5.png", "Gallery-3-img-6.png"]
        name = ["Workspaces", "Still Objects", "Funny Stuff", "Toys", "Fashion", "Women"]
        
        createView() // function for create header, create collectionview
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // Create headerMenu
        header = Bundle.main.loadNibNamed("ProfileHeader", owner: nil, options: nil)?.first as! ProfileHeader
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = "Profile"
        header.delegate = self
        self.view .addSubview(header)
        
        // function show or close menu left
        header.btnMenu.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        // Create tap
        tap = Bundle.main.loadNibNamed("ProfileCollectionMenuStyle19", owner: nil, options: nil)?.first as! ProfileCollectionMenuStyle19
        tap.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: 60)
        tap.active = 0
        status = 0
        tap.data = ["iconDashboardWhite", "iconDashboardWhite", "iconDashboardWhite", "iconDashboardWhite"]
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: self.view.frame.size.width/5, height: 50)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        tap.collection.setCollectionViewLayout(layout, animated: true)
        tap.collection.isScrollEnabled = false
        
        tap.collection.register(UINib(nibName: "ProfileCellStyle19", bundle: nil), forCellWithReuseIdentifier: "ProfileCellStyle19")
        tap.delegate = self
        tap.collection.backgroundColor = UIColor.init(red: 141/255, green: 40/255, blue: 170/255, alpha: 1)
        tap.backgroundColor = UIColor.init(red: 141/255, green: 40/255, blue: 170/255, alpha: 1)
        self.view .addSubview(tap)
        
        // Create headerCell
        headerCell = Bundle.main.loadNibNamed("ProfileCellPhotoStyle21", owner: nil, options: nil)?.first as! ProfileCellPhotoStyle21
        headerCell.frame = CGRect(x: 0, y: 140, width: self.view.frame.size.width, height: 100)
        headerCell.name.text = "Michael Angelo"
        headerCell.posisi.text = "UI Designer"
        self.view.addSubview(headerCell)
        
        // create collectionview
        let layoutt = CHTCollectionViewWaterfallLayout()
        layoutt.minimumColumnSpacing = 10
        layoutt.minimumInteritemSpacing = 10
        layoutt.columnCount = 2
        layoutt.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        
        collMenu = UICollectionView(frame: CGRect(x: 0, y: 240, width: self.view.frame.size.width, height: self.view.frame.size.height-240-70), collectionViewLayout: layoutt)
        collMenu.autoresizingMask = [UIViewAutoresizing.flexibleHeight, UIViewAutoresizing.flexibleWidth]
        collMenu.alwaysBounceVertical = true
        collMenu.backgroundColor = UIColor.clear
        collMenu.delegate = self;
        collMenu.dataSource = self;
        
        // regis UINib GalleryStyle3Cell
        collMenu.setCollectionViewLayout(layoutt, animated: true)
        collMenu.register(UINib(nibName: "GalleryStyle3Cell", bundle:nil), forCellWithReuseIdentifier: "GalleryStyle3Cell")
        
        self.view.addSubview(collMenu)
        
        // Create Footer
        footer = Bundle.main.loadNibNamed("ProfileFooterStyle3", owner: nil, options: nil)?.first as! ProfileFooterStyle3
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-70, width: self.view.frame.size.width, height: 70)
        footer.btnFollow.setTitle("Hire", for: .normal)
        footer.backgroundColor = UIColor.clear
        footer.delegate = self
        self.view .addSubview(footer)
        
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
    
    // ProfileCollectionMenuStyle19Delegate
    func activeMenu(index: IndexPath) {
        FunctionDefault.AlertMessage(title: "\(index.row)", message: "", targetVC: self)
    }
    // end
    
    // ProfileFooterStyle3Delegate
    func Follow() {
        FunctionDefault.AlertMessage(title: "Hire", message: "", targetVC: self)
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
