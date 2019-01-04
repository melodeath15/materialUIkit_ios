//
//  ProfileControllerStyle16.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 10/31/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ProfileControllerStyle16: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, ProfileHeaderDelegate, ProfileFloatingStyle16Delegate {

    private var tableStyle: UITableView = UITableView() // var tableView
    var collMenu: UICollectionView! // var collectionview
    var header = ProfileHeader() // var view xib in folder style1 name ViewActivityStyle1Header
    var footer = ProfileFloatingStyle16()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // function for create header, create table and regis UINib
        createCollection() // function for create collectionview
    }
    
    func createView(){
        
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
        
        // Create Table
        tableStyle.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80)
        tableStyle.delegate = self;
        tableStyle.dataSource = self;
        tableStyle.backgroundColor = UIColor.clear
        tableStyle.separatorColor = UIColor.clear
        tableStyle.allowsSelection = false
        
        // register UINib for ViewActivityStyle1Photo, ViewActivityStyle1Tought, ViewActivityStyle1NewFriends
        
        tableStyle.register(UINib(nibName: "ProfileHeaderCellStyle16", bundle: nil), forCellReuseIdentifier: "ProfileHeaderCellStyle16")
        tableStyle.register(UINib(nibName: "ViewActivityStyle1Photo", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle1Photo")
        tableStyle.register(UINib(nibName: "ViewActivityStyle1Tought", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle1Tought")
        tableStyle.register(UINib(nibName: "ViewActivityStyle1NewFriends", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle1NewFriends")
        
        self.view .addSubview(tableStyle)
        
        // Create footer
        footer = Bundle.main.loadNibNamed("ProfileFloatingStyle16", owner: nil, options: nil)?.first as! ProfileFloatingStyle16
        footer.frame = CGRect(x: self.view.frame.size.width-70, y: self.view.frame.size.height-70, width: 50, height: 50)
        footer.delegate = self
        self.view .addSubview(footer)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 180
        case 1:
            return 195
        case 2:
            return 130
        case 3:
            return 140
        default:
            return 195
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileHeaderCellStyle16", for: indexPath) as! ProfileHeaderCellStyle16
            
            cell.imgBG.downloadedFrom(link: "\(baseAssetProfile)Profile-16-header.jpg", contentMode: .scaleAspectFill)
            cell.name.text = "Michael Hendly"
            cell.follow.text = "270 Followers - 345 Following"
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle1Photo", for: indexPath) as! ViewActivityStyle1Photo
            
            let stringAttributed = NSMutableAttributedString.init(string: "Gabriella Madelaine Posted a photo")
            let lengt = stringAttributed.length
            let font = UIFont(name: "verdana-bold", size: 12.0)
            stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: 0, length: 0))
            stringAttributed.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGray, range: NSRange.init(location: lengt-14, length: 14))
            cell.name?.attributedText = stringAttributed
            
            cell.img.image = #imageLiteral(resourceName: "As1")
            cell.valueLove.text = "1347"
            cell.valueView.text = "19789"
            cell.valueTime.text = "An hour ago"
            
            cell.backgroundColor = UIColor.clear
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle1Tought", for: indexPath) as! ViewActivityStyle1Tought
            
            let stringAttributed = NSMutableAttributedString.init(string: "Tony Ramirez Posted a Tought")
            let lengt = stringAttributed.length
            let font = UIFont(name: "verdana-bold", size: 12.0)
            stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: 0, length: 0))
            stringAttributed.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGray, range: NSRange.init(location: lengt-15, length: 15))
            cell.name?.attributedText = stringAttributed
            
            cell.valueContent.text = "You're a work of art. not everyone will understand you, but the ones that do, will never forgot abaut you"
            cell.valueLove.text = "1347"
            cell.valueView.text = "19789"
            cell.valueTime.text = "3 days ago"
            
            cell.backgroundColor = UIColor.clear
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle1NewFriends", for: indexPath) as! ViewActivityStyle1NewFriends
            
            let stringAttributed = NSMutableAttributedString.init(string: "Anna Kendrick Added 3 new friends")
            let lengt = stringAttributed.length
            let font = UIFont(name: "verdana-bold", size: 12.0)
            stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: 0, length: 0))
            stringAttributed.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGray, range: NSRange.init(location: lengt-19, length: 19))
            cell.name?.attributedText = stringAttributed
            
            cell.viewColl.addSubview(collMenu)
            
            cell.valueLove.text = "1347"
            cell.valueView.text = "19789"
            cell.valueTime.text = "3 days ago"
            
            cell.backgroundColor = UIColor.clear
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle1Photo", for: indexPath) as! ViewActivityStyle1Photo
            
            let stringAttributed = NSMutableAttributedString.init(string: "Jean Basquiat Posted a photo")
            let lengt = stringAttributed.length
            let font = UIFont(name: "verdana-bold", size: 12.0)
            stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: 0, length: 0))
            stringAttributed.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGray, range: NSRange.init(location: lengt-14, length: 14))
            cell.name?.attributedText = stringAttributed
            
            cell.img.image = #imageLiteral(resourceName: "As2")
            cell.valueLove.text = "1347"
            cell.valueView.text = "19789"
            cell.valueTime.text = "An hour ago"
            
            cell.backgroundColor = UIColor.clear
            return cell
            
        default:
            let cell = UITableViewCell() // cell nil
            return cell
        }
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
    
    // ProfileFloatingStyle16Delegate
    func floating() {
        FunctionDefault.AlertMessage(title: "Floating", message: "", targetVC: self)
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
