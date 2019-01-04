//
//  ActivityStyle15Controller.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ActivityStyle15Controller: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, ViewActivityStyle1HeaderDelegate, ViewActivityStyle15TextDelegate, ViewActivityStyle15ImageSmallDelegate, ViewActivityStyle15FriendsDelegate, ViewActivityStyle15ImageBigDelegate {
    
    private var tableStyle: UITableView = UITableView() // var tableView
    var collMenu: UICollectionView! // var collectionView
    var header = ViewActivityStyle1Header() // var view xib in folder style1 name ViewActivityStyle1Header
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // function for create header, create table and regis UINib
        createCollection() // function for create collectionview
    }
    
    func createView(){
        
        // Create Header
        header = Bundle.main.loadNibNamed("ViewActivityStyle1Header", owner: nil, options: nil)?.first as! ViewActivityStyle1Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.iconBack.setImage(UIImage(named: "menu1"), for: .normal)
        header.btnWrite.isHidden = true
        
        // function show or close menu left
        header.iconBack.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        header.delegate = self
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        self.view.addSubview(header)
        
        // Create Table
        tableStyle.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80)
        tableStyle.delegate = self;
        tableStyle.dataSource = self;
        tableStyle.backgroundColor = UIColor.clear
        tableStyle.separatorColor = UIColor.clear
        tableStyle.allowsSelection = false
        
        // register UINib for ViewActivityStyle15Text, ViewActivityStyle15ImageSmall, ViewActivityStyle15Friends, ViewActivityStyle15ImageBig
        tableStyle.register(UINib(nibName: "ViewActivityStyle15Text", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle15Text")
        tableStyle.register(UINib(nibName: "ViewActivityStyle15ImageSmall", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle15ImageSmall")
        tableStyle.register(UINib(nibName: "ViewActivityStyle15Friends", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle15Friends")
        tableStyle.register(UINib(nibName: "ViewActivityStyle15ImageBig", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle15ImageBig")

        self.view .addSubview(tableStyle)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 175
        }else if indexPath.row == 1 {
            return 220
        }else if indexPath.row == 2{
            return 180
        }else{
            return 340
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle15Text", for: indexPath) as! ViewActivityStyle15Text
            
            let stringMain = "Christina Posted"
            let stringDefault = "Posted "
            
            let locDefault = stringMain.characters.count-stringDefault.characters.count
            
            let stringAttributed = NSMutableAttributedString.init(string: "Christina Posted")
            let font = UIFont(name: "verdana", size: 12)
            
            stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
            cell.name?.attributedText = stringAttributed
            
            cell.imgProfile.image = #imageLiteral(resourceName: "profile1")
            cell.time.text = "An hour ago"
            cell.titile.text = "Today's Post from Greenland!"
            cell.des.text = "Weasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and altruistic amiable far much foward"
            cell.valueLove.text = "1347"
            cell.valueView.text = "19789"
            cell.indexPathCell = indexPath
            cell.backgroundColor = UIColor.clear
            cell.delegate = self
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle15ImageSmall", for: indexPath) as! ViewActivityStyle15ImageSmall
            
            let stringMain = "Gabrielle Madelaine Liked a Post"
            let stringDefault = "Liked a Post "
            
            let locDefault = stringMain.characters.count-stringDefault.characters.count
            
            let stringAttributed = NSMutableAttributedString.init(string: "Gabrielle Madelaine Liked a Post")
            let font = UIFont(name: "verdana", size: 12)
            
            stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
            cell.name?.attributedText = stringAttributed
            
            cell.profileImg.image = #imageLiteral(resourceName: "profile1")
            cell.time.text = "14.30"
            cell.imgFoto.image = #imageLiteral(resourceName: "As10.1")
            cell.title.text = "Introduction to UX Designs"
            cell.posted.text = "Posted by Tony Ramirez"
            cell.des.text = "Weasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and altruistic amiable far much foward"
            cell.valueLove.text = "1347"
            cell.valueView.text = "19789"
            cell.indexPathCell = indexPath
            cell.backgroundColor = UIColor.clear
            cell.delegate = self
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle15Friends", for: indexPath) as! ViewActivityStyle15Friends
            
            let stringMain = "Christopher Nolan Added 3 friends"
            let stringDefault = "Added 3 friends "
            
            let locDefault = stringMain.characters.count-stringDefault.characters.count
            
            let stringAttributed = NSMutableAttributedString.init(string: "Christopher Nolan Added 3 friends")
            let font = UIFont(name: "verdana", size: 12)
            
            stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
            cell.name?.attributedText = stringAttributed
            
            cell.imgProfile.image = #imageLiteral(resourceName: "profile2")
            cell.viewColl.addSubview(collMenu)
            cell.time.text = "3 days ago"
            cell.valueLove.text = "1347"
            cell.valueView.text = "19789"
            cell.indexPathCell = indexPath
            cell.backgroundColor = UIColor.clear
            cell.delegate = self
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle15ImageBig", for: indexPath) as! ViewActivityStyle15ImageBig
            
            let stringMain = "Christina Posted"
            let stringDefault = "Posted "
            
            let locDefault = stringMain.characters.count-stringDefault.characters.count
            
            let stringAttributed = NSMutableAttributedString.init(string: "Christina Posted")
            let font = UIFont(name: "verdana", size: 12)
            
            stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
            cell.name?.attributedText = stringAttributed
            
            cell.imgProfile.image = #imageLiteral(resourceName: "profile1")
            cell.time.text = "A week ago"
            cell.imgPoster.image = #imageLiteral(resourceName: "As9.2")
            cell.title.text = "Japanese Cuisine"
            cell.des.text = "Weasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and altruistic amiable far much foward"
            cell.valueLove.text = "1347"
            cell.valueView.text = "19789"
            cell.indexPathCell = indexPath
            cell.backgroundColor = UIColor.clear
            cell.delegate = self
            return cell
            
        default:
            break
        }
        
        let cell = UITableViewCell() // cell nil
        return cell
    }
    
    func createCollection() { // function create collectionview
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 50, height:50)
        layout.scrollDirection = .horizontal
        
        collMenu = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width-60, height: 60), collectionViewLayout: layout)
        collMenu.backgroundColor = UIColor.white
        collMenu.delegate = self;
        collMenu.dataSource = self;
        
        // regis UINib ViewActivityStyle1NewFriendsCell
        collMenu.register(UINib(nibName: "ViewActivityStyle1NewFriendsCell", bundle:nil), forCellWithReuseIdentifier: "ViewActivityStyle1NewFriendsCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ViewActivityStyle1NewFriendsCell", for: indexPath) as! ViewActivityStyle1NewFriendsCell
        
        switch indexPath.row {
        case 0:
            cell.imgCell.image = #imageLiteral(resourceName: "profile1")
        case 1:
            cell.imgCell.image = #imageLiteral(resourceName: "profile2")
        case 2:
            cell.imgCell.image = #imageLiteral(resourceName: "profile3")
        default:
            break
        }
        
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    // ViewActivityStyle1HeaderDelegate
    func MenuOrBack() { // function for back layout
        // function hidden for left menu
    }
    
    func Write() { // function for write
        FunctionDefault.AlertMessage(title: "Write", message: "", targetVC: self)
    }
    
    func Search() { // function for search
        FunctionDefault.AlertMessage(title: "Search", message: "", targetVC: self)
    }
    
    func Option() { // function for menu option
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
        self.present(actionSheet, animated: true, completion: nil)    }
    // end
    
    // Delegate ViewActivityStyle15Text, ViewActivityStyle15ImageSmall, ViewActivityStyle15Friends, ViewActivityStyle15ImageBig
    func like(index: IndexPath) {
        FunctionDefault.AlertMessage(title: "Push Like" , message: String(index.row), targetVC: self)
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
