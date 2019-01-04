//
//  ProfileControllerStyle2.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 10/31/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ProfileControllerStyle2: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, ProfileHeaderDelegate, ProfileTapCollectionDelegate {
    
    var headerMenu = ProfileHeader()
    var header = ProfileHeader2()
    var tap = ProfileTapCollection()
    var collection: UICollectionView!
    
    var status = Int()
    var img = NSArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        img = [
            "\(baseAssetProfile)Profile-2-post1.png",
            "\(baseAssetProfile)Profile-2-post2.png",
            "\(baseAssetProfile)Profile-2-post3.png",
            "\(baseAssetProfile)Profile-2-post4.png",
            "\(baseAssetProfile)Profile-2-post5.png",
            "\(baseAssetProfile)Profile-2-post6.png",
            "\(baseAssetProfile)Profile-2-post7.png",
            "\(baseAssetProfile)Profile-2-post8.png",
            "\(baseAssetProfile)Profile-2-pos9.png",
            "\(baseAssetProfile)Profile-2-post10.png",
            "\(baseAssetProfile)Profile-2-post11.png",
            "\(baseAssetProfile)Profile-2-post12.png",
            "\(baseAssetProfile)Profile-2-post1.png",
            "\(baseAssetProfile)Profile-2-post2.png",
            "\(baseAssetProfile)Profile-2-post3.png",
            "\(baseAssetProfile)Profile-2-post4.png",
            "\(baseAssetProfile)Profile-2-post5.png",
            "\(baseAssetProfile)Profile-2-post6.png",
            "\(baseAssetProfile)Profile-2-post7.png",
            "\(baseAssetProfile)Profile-2-post8.png",
            "\(baseAssetProfile)Profile-2-post9.png",
            "\(baseAssetProfile)Profile-2-post10.png",
            "\(baseAssetProfile)Profile-2-post11.png",
            "\(baseAssetProfile)Profile-2-post12.png"
        ]
        
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
        header = Bundle.main.loadNibNamed("ProfileHeader2", owner: nil, options: nil)?.first as! ProfileHeader2
        header.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: 150)
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
        layout.itemSize = CGSize(width: self.view.frame.size.width/5.3+5, height: self.view.frame.size.width/5.3+5)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        collection = UICollectionView(frame: CGRect(x: 0, y: 290, width: self.view.frame.size.width, height: self.view.frame.size.height-290), collectionViewLayout: layout)
        collection.backgroundColor = UIColor.clear
        collection.delegate = self
        collection.dataSource = self
        
        collection.setCollectionViewLayout(layout, animated: true)
        collection.register(UINib(nibName: "ProfileStyle2Cell", bundle:nil), forCellWithReuseIdentifier: "ProfileStyle2Cell")
        self.view.addSubview(collection)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch status {
        case 0:
            return img.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileStyle2Cell", for: indexPath) as! ProfileStyle2Cell
        
        switch status {
        case 0:
            cell.img.downloadedFrom(link: "\(img[indexPath.row])", contentMode: .scaleAspectFill)
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
