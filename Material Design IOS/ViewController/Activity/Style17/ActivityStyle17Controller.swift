//
//  ActivityStyle17Controller.swift
//  Material Design IOS
//
//  Created by yanuar prisantoso on 6/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ActivityStyle17Controller: UIViewController, UITableViewDelegate, UITableViewDataSource, ViewActivityStyle1HeaderDelegate,ViewActivityStyle17MenuDelegate {
    
    private var tableFeed: UITableView = UITableView() // table for Feed
    private var tableNofif: UITableView = UITableView() // table for Notif
    var header = ViewActivityStyle1Header() // var view xib in folder style1 name ViewActivityStyle1Header
    var headerMenu = ViewActivityStyle17Menu() // var view xib in folder style17 name ViewActivityStyle17Menu
    var tap = NSInteger() //show table sign in
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tap = 1
        createView() // call function for create header, create header menu, table and regis xib/UINib
    }
    
    func createView() {
        
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
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        self.view.addSubview(header)
        
        // Create Header Menu
        headerMenu = Bundle.main.loadNibNamed("ViewActivityStyle17Menu", owner: nil, options: nil)?.first as! ViewActivityStyle17Menu
        headerMenu.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: 50)
        
        headerMenu.btnNotif.setTitleColor(UIColor.white, for: .normal)
        headerMenu.btnFeed.setTitleColor(UIColor.lightText, for: .normal)
        headerMenu.viewButton.isHidden = true
        headerMenu.viewButton2.isHidden = false
        
        headerMenu.delegate = self
        self.view.addSubview(headerMenu)
        
        // Create tableFeed
        tableFeed.frame = CGRect(x: 0, y: 130, width: self.view.frame.size.width, height: self.view.frame.size.height-130)
        tableFeed.delegate = self;
        tableFeed.dataSource = self;
        tableFeed.backgroundColor = UIColor.clear
        tableFeed.separatorColor = UIColor.clear
        tableFeed.allowsSelection = false
        tableFeed.tag = 0

        // register UINib for ViewActivityStyle17Text, ViewActivityStyle17ImgBig, ViewActivityStyle17ImgSmall
        tableFeed.register(UINib(nibName: "ViewActivityStyle17Text", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle17Text")
        tableFeed.register(UINib(nibName: "ViewActivityStyle17ImgBig", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle17ImgBig")
        tableFeed.register(UINib(nibName: "ViewActivityStyle17ImgSmall", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle17ImgSmall")
        
        self.view .addSubview(tableFeed)

        // Create tableFeed
        tableNofif.frame = CGRect(x: 0, y: 130, width: self.view.frame.size.width, height: self.view.frame.size.height-130)
        tableNofif.delegate = self;
        tableNofif.dataSource = self;
        tableNofif.backgroundColor = UIColor.clear
        tableNofif.separatorColor = UIColor.clear
        tableNofif.allowsSelection = false
        tableNofif.tag = 1
        
        // register UINib for ViewActivityStyle17Text, ViewActivityStyle17ImgBig, ViewActivityStyle17ImgSmall
        tableNofif.register(UINib(nibName: "ViewActivityStyle17Text", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle17Text")
        tableNofif.register(UINib(nibName: "ViewActivityStyle17ImgBig", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle17ImgBig")
        tableNofif.register(UINib(nibName: "ViewActivityStyle17ImgSmall", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle17ImgSmall")
        
        self.view .addSubview(tableNofif)
        
        if tap == 0 {
            Feed()
        }else if tap == 1{
            Notif()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 60
        }else if indexPath.row == 1{
            return 60
        }else if indexPath.row == 2{
            return 200
        }else if indexPath.row == 3{
            return 150
        }else{
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView.tag {
        case 0:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle17Text", for: indexPath) as! ViewActivityStyle17Text
                
                let stringMain = "Gabriella Madelaine Added you as her friend"
                let stringDefault = "Added you as her friend "
                
                let locDefault = stringMain.characters.count-stringDefault.characters.count
                
                let stringAttributed = NSMutableAttributedString.init(string: "Gabriella Madelaine Added you as her friend")
                let font = UIFont(name: "verdana", size: 12)
                
                stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
                cell.Name?.attributedText = stringAttributed
                cell.time.text = "1m"
                cell.imgNotif.image = #imageLiteral(resourceName: "notif1")
                cell.time.text = "1m"
                cell.backgroundColor = UIColor.clear
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle17Text", for: indexPath) as! ViewActivityStyle17Text
                
                let stringMain = "Tony Ramirez commented on your photo"
                let stringDefault = "commented on your photo "
                
                let locDefault = stringMain.characters.count-stringDefault.characters.count
                
                let stringAttributed = NSMutableAttributedString.init(string: "Tony Ramirez commented on your photo")
                let font = UIFont(name: "verdana", size: 12)
                
                stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
                cell.Name?.attributedText = stringAttributed
                cell.time.text = "3h"
                cell.imgNotif.image = #imageLiteral(resourceName: "notif2")
                cell.backgroundColor = UIColor.clear
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle17ImgBig", for: indexPath) as! ViewActivityStyle17ImgBig
                
                let stringMain = "Christina loved your photo"
                let stringDefault = "loved your photo "
                
                let locDefault = stringMain.characters.count-stringDefault.characters.count
                
                let stringAttributed = NSMutableAttributedString.init(string: "Christina loved your photo")
                let font = UIFont(name: "verdana", size: 12)
                
                stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
                cell.Name?.attributedText = stringAttributed
                cell.imgPhoto.image = #imageLiteral(resourceName: "As6.1")
                cell.imgNotif.image = #imageLiteral(resourceName: "notif3")
                cell.time.text = "3h"
                cell.backgroundColor = UIColor.clear
                return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle17ImgSmall", for: indexPath) as! ViewActivityStyle17ImgSmall
                
                let stringMain = "Gabriella Madelaine Tagged your in a Post"
                let stringDefault = "Tagged your in a Post "
                
                let locDefault = stringMain.characters.count-stringDefault.characters.count
                
                let stringAttributed = NSMutableAttributedString.init(string: "Gabriella Madelaine Tagged your in a Post")
                let font = UIFont(name: "verdana", size: 12)
                
                stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
                cell.Name?.attributedText = stringAttributed
                cell.imgPhoto.image = #imageLiteral(resourceName: "As10.1")
                cell.titile.text = "Introduction to UX Designs"
                cell.posted.text = "Posted by Tony Ramirez"
                cell.des.text = "Weasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and altruistic amiable far much foward"
                cell.time.text = "1d"
                cell.backgroundColor = UIColor.clear
                return cell
            case 4:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle17Text", for: indexPath) as! ViewActivityStyle17Text
                
                let stringMain = "Tony Ramirez commented on your Post"
                let stringDefault = "commented on your Post "
                
                let locDefault = stringMain.characters.count-stringDefault.characters.count
                
                let stringAttributed = NSMutableAttributedString.init(string: "Tony Ramirez commented on your Post")
                let font = UIFont(name: "verdana", size: 12)
                
                stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
                cell.Name?.attributedText = stringAttributed
                cell.time.text = "3h"
                cell.imgNotif.image = #imageLiteral(resourceName: "notif2")
                cell.backgroundColor = UIColor.clear
                return cell
            default:
                break
            }
            
            
        case 1:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle17Text", for: indexPath) as! ViewActivityStyle17Text
                
                let stringMain = "Gabriella Madelaine Added you as her friend"
                let stringDefault = "Added you as her friend "
                
                let locDefault = stringMain.characters.count-stringDefault.characters.count
                
                let stringAttributed = NSMutableAttributedString.init(string: "Gabriella Madelaine Added you as her friend")
                let font = UIFont(name: "verdana", size: 12)
                
                stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
                cell.Name?.attributedText = stringAttributed
                cell.time.text = "1m"
                cell.imgNotif.image = #imageLiteral(resourceName: "notif1")
                cell.backgroundColor = UIColor.clear
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle17Text", for: indexPath) as! ViewActivityStyle17Text
                
                let stringMain = "Tony Ramirez commented on your photo"
                let stringDefault = "commented on your photo "
                
                let locDefault = stringMain.characters.count-stringDefault.characters.count
                
                let stringAttributed = NSMutableAttributedString.init(string: "Tony Ramirez commented on your photo")
                let font = UIFont(name: "verdana", size: 12)
                
                stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
                cell.Name?.attributedText = stringAttributed
                cell.time.text = "3h"
                cell.imgNotif.image = #imageLiteral(resourceName: "notif2")
                cell.backgroundColor = UIColor.clear
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle17ImgBig", for: indexPath) as! ViewActivityStyle17ImgBig
                
                let stringMain = "Christina loved your photo"
                let stringDefault = "loved your photo "
                
                let locDefault = stringMain.characters.count-stringDefault.characters.count
                
                let stringAttributed = NSMutableAttributedString.init(string: "Christina loved your photo")
                let font = UIFont(name: "verdana", size: 12)
                
                stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
                cell.Name?.attributedText = stringAttributed
                cell.imgPhoto.image = #imageLiteral(resourceName: "As6.2")
                cell.imgNotif.image = #imageLiteral(resourceName: "notif3")
                cell.time.text = "3h"
                cell.backgroundColor = UIColor.clear
                return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle17ImgSmall", for: indexPath) as! ViewActivityStyle17ImgSmall
                
                let stringMain = "Gabriella Madelaine Tagged your in a Post"
                let stringDefault = "Tagged your in a Post "
                
                let locDefault = stringMain.characters.count-stringDefault.characters.count
                
                let stringAttributed = NSMutableAttributedString.init(string: "Gabriella Madelaine Tagged your in a Post")
                let font = UIFont(name: "verdana", size: 12)
                
                stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
                cell.Name?.attributedText = stringAttributed
                cell.imgPhoto.image = #imageLiteral(resourceName: "As10.1")
                cell.titile.text = "Introduction to UX Designs"
                cell.posted.text = "Posted by Tony Ramirez"
                cell.des.text = "Weasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and altruistic amiable far much foward"
                cell.time.text = "1d"
                cell.backgroundColor = UIColor.clear
                return cell
            case 4:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle17Text", for: indexPath) as! ViewActivityStyle17Text
                
                let stringMain = "Tony Ramirez commented on your Post"
                let stringDefault = "commented on your Post "
                
                let locDefault = stringMain.characters.count-stringDefault.characters.count
                
                let stringAttributed = NSMutableAttributedString.init(string: "Tony Ramirez commented on your Post")
                let font = UIFont(name: "verdana", size: 12)
                
                stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
                cell.Name?.attributedText = stringAttributed
                cell.time.text = "3h"
                cell.imgNotif.image = #imageLiteral(resourceName: "notif2")
                cell.backgroundColor = UIColor.clear
                return cell
            default:
                break
            }
            
        default:
            break
        }
        
        let cell = UITableViewCell() // cell nil
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

    // Delegate ViewActivityStyle17MenuDelegate
    func Feed(){ // function tap button feed
        tap = 1
        tableNofif.isHidden = true
        tableFeed.isHidden = false
    }
    
    func Notif(){ // function tap button notif
        tap = 0
        tableNofif.isHidden = false
        tableFeed.isHidden = true
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
