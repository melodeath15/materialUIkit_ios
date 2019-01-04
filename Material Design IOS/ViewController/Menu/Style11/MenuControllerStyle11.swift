//
//  MenuControllerStyle11.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/14/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class MenuControllerStyle11: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, MenuStyle11HeaderDelegate {

    private var tableStyle: UITableView = UITableView() // var tableView
    var collMenu: UICollectionView! // var collectionview
    var header = MenuStyle11Header() // var view xib in folder menu style11 name MenuStyle11Header
    var menuShow = UIViewController() // var view menushow
    var show = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // function for create header, create table and regis UINib, create menu show
        createCollection() // function for create collectionview
    }
    
    func createView(){
        
        // Create Table
        tableStyle.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80)
        tableStyle.delegate = self;
        tableStyle.dataSource = self;
        tableStyle.backgroundColor = UIColor.clear
        tableStyle.separatorColor = UIColor.clear
        tableStyle.allowsSelection = false
        
        // register UINib for ViewActivityStyle1Photo, ViewActivityStyle1Tought, ViewActivityStyle1NewFriends
        tableStyle.register(UINib(nibName: "ViewActivityStyle1Photo", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle1Photo")
        tableStyle.register(UINib(nibName: "ViewActivityStyle1Tought", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle1Tought")
        tableStyle.register(UINib(nibName: "ViewActivityStyle1NewFriends", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle1NewFriends")
        
        self.view .addSubview(tableStyle)
        
        // Create MenuShow
        menuShow = (storyboard?.instantiateViewController(withIdentifier: "MenuLeftControllerStyle11"))!
        addChildViewController(menuShow)
        menuShow.view.frame = CGRect(x: -self.view.frame.size.width, y: 80, width: self.view.frame.size.width/3.5, height: self.view.frame.size.height-80)
        self.view.addSubview((menuShow.view)!)
        
        // Create Header
        header = Bundle.main.loadNibNamed("MenuStyle11Header", owner: nil, options: nil)?.first as! MenuStyle11Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.delegate = self
        self.view.addSubview(header)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 195
        }else if indexPath.row == 1 {
            return 130
        }else if indexPath.row == 2{
            return 140
        }else{
            return 195
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
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
        case 1:
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
        case 2:
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
        case 3:
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
    
    // MenuStyle11HeaderDelegate
    func menu() { // function for menu
        if show {
            UIView.animate(withDuration: 0.5, animations: {
                self.menuShow.view.frame.origin.x = 0
                self.header.btnMenu.setImage(UIImage(named: "BackIcon"), for: .normal)
            }, completion: { (Bool) in
                self.show = false
                
            })
        }else{
            UIView.animate(withDuration: 0.5, animations: {
                self.menuShow.view.frame.origin.x = -self.view.frame.size.width/3.5
                self.header.btnMenu.setImage(UIImage(named: "menu1"), for: .normal)
            }, completion: { (Bool) in
                self.show = true
                
            })
        }
    }
    
    func searchBar(text: String) {
        print("cek =\(text)")
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
