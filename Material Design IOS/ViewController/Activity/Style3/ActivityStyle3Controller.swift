//
//  ActivityStyle3Controller.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/5/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ActivityStyle3Controller: UIViewController, UITableViewDelegate, UITableViewDataSource, ViewActivityStyle1HeaderDelegate, ViewActivityStyle3MenuDelegate, ViewActivityStyle3TextDelegate, ViewActivituStyle3ImageDelegate {
    
    private var tableFeed: UITableView = UITableView() // var tableView
    private var tablePopuler: UITableView = UITableView() // var tableView
    private var tableMedia: UITableView = UITableView() // var tableView

    var header = ViewActivityStyle1Header() // var view xib in folder style1 name ViewActivityStyle1Header
    var menuView = ViewActivityStyle3Menu() // var view xib in folder style3 name ViewActivituStyle3Image
    var tapMenu = NSInteger() // show tap menu
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapMenu = 0 // show tap menu Feed
        createView() // function for create header, create menu view, create table and regis UINib
    }
    
    func createView(){
        
        // Create Header
        header = Bundle.main.loadNibNamed("ViewActivityStyle1Header", owner: nil, options: nil)?.first as! ViewActivityStyle1Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.iconBack.setImage(UIImage(named: "menu1"), for: .normal)
        
        // function show or close menu left
        header.iconBack.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        header.delegate = self
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        self.view.addSubview(header)
        
        // Create Menu View
        menuView = Bundle.main.loadNibNamed("ViewActivityStyle3Menu", owner: nil, options: nil)?.first as! ViewActivityStyle3Menu
        menuView.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: 40)
        menuView.delegate = self
        self.view.addSubview(menuView)
        
        // Create tableFeed
        tableFeed.frame = CGRect(x: 0, y: 120, width: self.view.frame.size.width, height: self.view.frame.size.height-120)
        tableFeed.delegate = self;
        tableFeed.dataSource = self;
        tableFeed.backgroundColor = UIColor.clear
        tableFeed.separatorColor = UIColor.clear
        tableFeed.allowsSelection = false
        tableFeed.tag = 0
        
        // register UINib for ViewActivityStyle3Text, ViewActivituStyle3Image
        tableFeed.register(UINib(nibName: "ViewActivityStyle3Text", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle3Text")
        tableFeed.register(UINib(nibName: "ViewActivituStyle3Image", bundle: nil), forCellReuseIdentifier: "ViewActivituStyle3Image")
        self.view .addSubview(tableFeed)

        // Create tablePopuler
        tablePopuler.frame = CGRect(x: 0, y: 120, width: self.view.frame.size.width, height: self.view.frame.size.height-120)
        tablePopuler.delegate = self;
        tablePopuler.dataSource = self;
        tablePopuler.backgroundColor = UIColor.clear
        tablePopuler.separatorColor = UIColor.clear
        tablePopuler.allowsSelection = false
        tablePopuler.tag = 1
        
        // register UINib for ViewActivityStyle3Text, ViewActivituStyle3Image
        tablePopuler.register(UINib(nibName: "ViewActivityStyle3Text", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle3Text")
        tablePopuler.register(UINib(nibName: "ViewActivituStyle3Image", bundle: nil), forCellReuseIdentifier: "ViewActivituStyle3Image")
        self.view .addSubview(tablePopuler)

        // Create tableMedia
        tableMedia.frame = CGRect(x: 0, y: 120, width: self.view.frame.size.width, height: self.view.frame.size.height-120)
        tableMedia.delegate = self;
        tableMedia.dataSource = self;
        tableMedia.backgroundColor = UIColor.clear
        tableMedia.separatorColor = UIColor.clear
        tableMedia.allowsSelection = false
        tableMedia.tag = 2
        
        // register UINib for ViewActivityStyle3Text, ViewActivituStyle3Image
        tableMedia.register(UINib(nibName: "ViewActivityStyle3Text", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle3Text")
        tableMedia.register(UINib(nibName: "ViewActivituStyle3Image", bundle: nil), forCellReuseIdentifier: "ViewActivituStyle3Image")
        self.view .addSubview(tableMedia)
        
        
        if tapMenu == 0 {
            tableFeed.isHidden = false
            tableMedia.isHidden = true
            tablePopuler.isHidden = true
        }else if tapMenu == 1{
            tableFeed.isHidden = true
            tableMedia.isHidden = true
            tablePopuler.isHidden = false
        }else if tapMenu == 2{
            tableFeed.isHidden = true
            tableMedia.isHidden = false
            tablePopuler.isHidden = true
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 130
        }else if indexPath.row == 1 {
            return 130
        }else if indexPath.row == 2{
            return 280
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView.tag {
        case 0: // table feed
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle3Text", for: indexPath) as! ViewActivityStyle3Text
                
                cell.imgProfile.image = #imageLiteral(resourceName: "profile1")
                cell.name.text = "Gabriella Madelaine"
                cell.time.text = "An hour ago"
                cell.note.text = "Weasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and altruistic amiable far much foward"
                cell.valueComments.text = "3"
                cell.valueLike.text = "1"
                
                cell.backgroundColor = UIColor.clear
                cell.delegate = self
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle3Text", for: indexPath) as! ViewActivityStyle3Text
                
                cell.imgProfile.image = #imageLiteral(resourceName: "profile2")
                cell.name.text = "Tony Ramirez"
                cell.time.text = "3 days ago"
                cell.note.text = "Weasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and altruistic amiable far much foward"
                cell.valueComments.text = "23"
                cell.valueLike.text = "4"
                
                cell.backgroundColor = UIColor.clear
                cell.delegate = self
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivituStyle3Image", for: indexPath) as! ViewActivituStyle3Image
                
                cell.imgProfile.image = #imageLiteral(resourceName: "profile1")
                cell.name.text = "Gabriella Madelaine"
                cell.time.text = "An hour ago"
                
                cell.postedPhoto.image = #imageLiteral(resourceName: "As1")
                cell.note.text = "Weasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and altruistic amiable far much foward"
                cell.valueComments.text = "10"
                cell.valueLike.text = "8"
                
                cell.backgroundColor = UIColor.clear
                cell.delegate = self
                return cell
            default:
                break
            }
            
            let cell = UITableViewCell() // cell nil
            return cell
            
        case 1: // table popular
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle3Text", for: indexPath) as! ViewActivityStyle3Text
                
                cell.imgProfile.image = #imageLiteral(resourceName: "profile1")
                cell.name.text = "Gabriella Madelaine"
                cell.time.text = "An hour ago"
                cell.note.text = "Weasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and altruistic amiable far much foward"
                cell.valueComments.text = "3"
                cell.valueLike.text = "1"
                
                cell.backgroundColor = UIColor.clear
                cell.delegate = self
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle3Text", for: indexPath) as! ViewActivityStyle3Text
                
                cell.imgProfile.image = #imageLiteral(resourceName: "profile2")
                cell.name.text = "Tony Ramirez"
                cell.time.text = "3 days ago"
                cell.note.text = "Weasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and altruistic amiable far much foward"
                cell.valueComments.text = "23"
                cell.valueLike.text = "4"
                
                cell.backgroundColor = UIColor.clear
                cell.delegate = self
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivituStyle3Image", for: indexPath) as! ViewActivituStyle3Image
                
                cell.imgProfile.image = #imageLiteral(resourceName: "profile1")
                cell.name.text = "Gabriella Madelaine"
                cell.time.text = "An hour ago"
                
                cell.postedPhoto.image = #imageLiteral(resourceName: "As2")
                cell.note.text = "Weasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and altruistic amiable far much foward"
                cell.valueComments.text = "10"
                cell.valueLike.text = "8"
                
                cell.backgroundColor = UIColor.clear
                cell.delegate = self
                return cell
            default:
                break
            }
            
            let cell = UITableViewCell() // cell nil
            return cell
            
        case 2: // table media
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle3Text", for: indexPath) as! ViewActivityStyle3Text
                
                cell.imgProfile.image = #imageLiteral(resourceName: "profile1")
                cell.name.text = "Gabriella Madelaine"
                cell.time.text = "An hour ago"
                cell.note.text = "Weasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and altruistic amiable far much foward"
                cell.valueComments.text = "3"
                cell.valueLike.text = "1"
                
                cell.backgroundColor = UIColor.clear
                cell.delegate = self
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle3Text", for: indexPath) as! ViewActivityStyle3Text
                
                cell.imgProfile.image = #imageLiteral(resourceName: "profile2")
                cell.name.text = "Tony Ramirez"
                cell.time.text = "3 days ago"
                cell.note.text = "Weasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and altruistic amiable far much foward"
                cell.valueComments.text = "23"
                cell.valueLike.text = "4"
                
                cell.backgroundColor = UIColor.clear
                cell.delegate = self
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivituStyle3Image", for: indexPath) as! ViewActivituStyle3Image
                
                cell.imgProfile.image = #imageLiteral(resourceName: "profile1")
                cell.name.text = "Gabriella Madelaine"
                cell.time.text = "An hour ago"
                
                cell.postedPhoto.image = #imageLiteral(resourceName: "As3")
                cell.note.text = "Weasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and altruistic amiable far much foward"
                cell.valueComments.text = "10"
                cell.valueLike.text = "8"
                
                cell.backgroundColor = UIColor.clear
                cell.delegate = self
                return cell
            default:
                break
            }
            
            let cell = UITableViewCell() // cell nil
            return cell
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
        self.present(actionSheet, animated: true, completion: nil)
    }
    // end
    
    // ViewActivityStyle3MenuDelegate
    func feed() {
        tapMenu = 0
        tableFeed.isHidden = false
        tableMedia.isHidden = true
        tablePopuler.isHidden = true
    }
    func popular() {
        tableFeed.isHidden = true
        tableMedia.isHidden = true
        tablePopuler.isHidden = false
    }
    
    func media() {
        tableFeed.isHidden = true
        tableMedia.isHidden = false
        tablePopuler.isHidden = true
    }
    // end
    
    // ViewActivityStyle3TextDelegate
    func comments() {
        FunctionDefault.AlertMessage(title: "comments", message: "", targetVC: self)
    }
    
    func like() {
        FunctionDefault.AlertMessage(title: "like", message: "", targetVC: self)
    }
    // end
    
    // ViewActivituStyle3ImageDelegate
    func commentsImg() {
        FunctionDefault.AlertMessage(title: "comments", message: "", targetVC: self)
    }
    
    func likeImg() {
        FunctionDefault.AlertMessage(title: "like", message: "", targetVC: self)
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
