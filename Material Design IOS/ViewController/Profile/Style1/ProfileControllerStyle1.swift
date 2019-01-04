//
//  ProfileControllerStyle1.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 10/31/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ProfileControllerStyle1: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, ProfileHeaderDelegate, ProfileHeader1Delegate, ProfileTapCollectionDelegate {

    var headerMenu = ProfileHeader()
    var header = ProfileHeader1()
    var tap = ProfileTapCollection()
    var collection: UICollectionView!
    
    var status = Int()
    var name1 = NSArray()
    var img1 = NSArray()
    var name2 = NSArray()
    var img2 = NSArray()
    var name3 = NSArray()
    var img3 = NSArray()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        img1 = ["\(baseAssetProfile)profile-1-post-1.jpg",
                "\(baseAssetProfile)profile-1-post-2.jpg",
                "\(baseAssetProfile)profile-1-post-3.jpg",
                "\(baseAssetProfile)profile-1-post-4.jpg",
                "\(baseAssetProfile)profile-1-post-1.jpg",
                "\(baseAssetProfile)profile-1-post-2.jpg"]
        
        name1 = ["Book Shelf", "Bedroom", "Furniture", "Objects", "Book Shelf", "Bedroom"]
        
        img2 = ["\(baseAssetProfile)profile-1-post-2.jpg",
                "\(baseAssetProfile)profile-1-post-1.jpg",
                "\(baseAssetProfile)profile-1-post-3.jpg",
                "\(baseAssetProfile)profile-1-post-4.jpg",
                "\(baseAssetProfile)profile-1-post-1.jpg",
                "\(baseAssetProfile)profile-1-post-2.jpg"]
        
        name2 = ["Book Shelf", "Bedroom", "Furniture", "Objects", "Book Shelf", "Bedroom"]
        
        img3 = ["\(baseAssetProfile)profile-1-post-3.jpg",
                "\(baseAssetProfile)profile-1-post-1.jpg",
                "\(baseAssetProfile)profile-1-post-2.jpg",
                "\(baseAssetProfile)profile-1-post-4.jpg",
                "\(baseAssetProfile)profile-1-post-1.jpg",
                "\(baseAssetProfile)profile-1-post-2.jpg"]
        
        name3 = ["Book Shelf", "Bedroom", "Furniture", "Objects", "Book Shelf", "Bedroom"]

        createView()
    }
    
    func createView(){
        // Create headerMenu
        headerMenu = Bundle.main.loadNibNamed("ProfileHeader", owner: nil, options: nil)?.first as! ProfileHeader
        headerMenu.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        headerMenu.title.text = "Profile"
        headerMenu.delegate = self
        self.view .addSubview(headerMenu)
        
        // function show or close menu left
        headerMenu.btnMenu.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        // Create Header
        header = Bundle.main.loadNibNamed("ProfileHeader1", owner: nil, options: nil)?.first as! ProfileHeader1
        header.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: 150)
        header.title.text = "Michael Angelo"
        header.imgBg.downloadedFrom(link: "\(baseAssetProfile)Profile-1-header.jpg", contentMode: .scaleAspectFill)
        header.delegate = self
        self.view .addSubview(header)
        
        // Create tap
        tap = Bundle.main.loadNibNamed("ProfileTapCollection", owner: nil, options: nil)?.first as! ProfileTapCollection
        tap.frame = CGRect(x: 0, y: 230, width: self.view.frame.size.width, height: 60)
        tap.counterMenu = 3
        tap.active = 0
        status = 0
        tap.data = ["359", "10.289", "4317"]
        tap.title = ["Photos", "Followers", "Followings"]
        tap.delegate = self
        self.view .addSubview(tap)
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: self.view.frame.size.width/2.3+5, height: self.view.frame.size.height/3)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        collection = UICollectionView(frame: CGRect(x: 0, y: 290, width: self.view.frame.size.width, height: self.view.frame.size.height-290), collectionViewLayout: layout)
        collection.backgroundColor = UIColor.clear
        collection.delegate = self
        collection.dataSource = self
        
        collection.setCollectionViewLayout(layout, animated: true)
        collection.register(UINib(nibName: "GalleryStyle14Cell", bundle:nil), forCellWithReuseIdentifier: "GalleryStyle14Cell")
        self.view.addSubview(collection)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch status {
        case 0:
            return img1.count
        case 1:
            return img2.count
        case 2:
            return img3.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryStyle14Cell", for: indexPath) as! GalleryStyle14Cell
        
        switch status {
        case 0:
            cell.img.downloadedFrom(link: "\(img1[indexPath.row])", contentMode: .scaleAspectFill)
            cell.title.text = "\(name1[indexPath.row])"
            cell.valueLove.text = "1347"
            cell.valueView.text = "19789"
        case 1:
            cell.img.downloadedFrom(link: "\(img2[indexPath.row])", contentMode: .scaleAspectFill)
            cell.title.text = "\(name2[indexPath.row])"
            cell.valueLove.text = "1347"
            cell.valueView.text = "19789"
        case 2:
            cell.img.downloadedFrom(link: "\(img3[indexPath.row])", contentMode: .scaleAspectFill)
            cell.title.text = "\(name3[indexPath.row])"
            cell.valueLove.text = "1347"
            cell.valueView.text = "19789"
        default:
            break
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        FunctionDefault.AlertMessage(title: "\(indexPath.row)", message: "", targetVC: self)
    }
    
    // ProfileHeaderDelegate
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
    
    // ProfileHeader1Delegate
    func email() {
        FunctionDefault.AlertMessage(title: "Email", message: "", targetVC: self)
    }
    
    func setting() {
        FunctionDefault.AlertMessage(title: "Setting", message: "", targetVC: self)
    }
    // end
    
    // ProfileTapCollectionDelegate
    func activeMenu(index: IndexPath) {
        status = index.row
        collection.reloadData()
    }
    // end
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
