//
//  ActivityStyle14Controller.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ActivityStyle14Controller: UIViewController, UITableViewDelegate, UITableViewDataSource, ViewActivityStyle1HeaderDelegate, ViewActivityStyle3MenuDelegate {
    
    private var tableNew: UITableView = UITableView() // var tableView new
    private var tablePopuler: UITableView = UITableView() // var tableView populer
    private var tableFavo: UITableView = UITableView() // var tableView favorite
    
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
        header.btnWrite.isHidden = true
        
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
        menuView.feed.setTitle("NEW", for: .normal)
        menuView.popular.setTitle("POPULAR", for: .normal)
        menuView.media.setTitle("FAVORITED", for: .normal)
        menuView.delegate = self
        self.view.addSubview(menuView)
        
        // Create tableNew
        tableNew.frame = CGRect(x: 0, y: 120, width: self.view.frame.size.width, height: self.view.frame.size.height-120)
        tableNew.delegate = self;
        tableNew.dataSource = self;
        tableNew.backgroundColor = UIColor.clear
        tableNew.separatorColor = UIColor.clear
        tableNew.allowsSelection = false
        tableNew.tag = 0
        
        // register UINib for ViewActivityStyle14Cell
        tableNew.register(UINib(nibName: "ViewActivityStyle14Cell", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle14Cell")
        self.view .addSubview(tableNew)
        
        // Create tablePopuler
        tablePopuler.frame = CGRect(x: 0, y: 120, width: self.view.frame.size.width, height: self.view.frame.size.height-120)
        tablePopuler.delegate = self;
        tablePopuler.dataSource = self;
        tablePopuler.backgroundColor = UIColor.clear
        tablePopuler.separatorColor = UIColor.clear
        tablePopuler.allowsSelection = false
        tablePopuler.tag = 1
        
        // register UINib for ViewActivityStyle14Cell
        tablePopuler.register(UINib(nibName: "ViewActivityStyle14Cell", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle14Cell")
        self.view .addSubview(tablePopuler)
        
        // Create tableFavo
        tableFavo.frame = CGRect(x: 0, y: 120, width: self.view.frame.size.width, height: self.view.frame.size.height-120)
        tableFavo.delegate = self;
        tableFavo.dataSource = self;
        tableFavo.backgroundColor = UIColor.clear
        tableFavo.separatorColor = UIColor.clear
        tableFavo.allowsSelection = false
        tableFavo.tag = 2
        
        // register UINib for ViewActivityStyle14Cell
        tableFavo.register(UINib(nibName: "ViewActivityStyle14Cell", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle14Cell")
        self.view .addSubview(tableFavo)
        
        
        if tapMenu == 0 {
            tableNew.isHidden = false
            tableFavo.isHidden = true
            tablePopuler.isHidden = true
        }else if tapMenu == 1{
            tableNew.isHidden = true
            tableFavo.isHidden = true
            tablePopuler.isHidden = false
        }else if tapMenu == 2{
            tableNew.isHidden = true
            tableFavo.isHidden = false
            tablePopuler.isHidden = true
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView.tag {
        case 0: // tableNew
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle14Cell", for: indexPath) as! ViewActivityStyle14Cell
                
                cell.imgCell.image = #imageLiteral(resourceName: "As9.1")
                cell.imgProfile.image = #imageLiteral(resourceName: "profile2")
                cell.name.text = "Tony Ramirez"
                cell.time.text = "An hour ago"
                cell.titile.text = "Shanghai City Landscape"
                cell.des.text = "Weasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and altruistic amiable far much foward"
                cell.hastax.text = "#shanghai #wow"
                cell.valueLove.text = "1347"
                cell.valueView.text = "19789"
                
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle14Cell", for: indexPath) as! ViewActivityStyle14Cell
                
                cell.imgCell.image = #imageLiteral(resourceName: "As9.2")
                cell.imgProfile.image = #imageLiteral(resourceName: "profile1")
                cell.name.text = "Gabrielle Madelaine"
                cell.time.text = "yesterday"
                cell.titile.text = "Japanese Cuisine"
                cell.des.text = "Weasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and altruistic amiable far much foward"
                cell.hastax.text = "#shanghai #wow"
                cell.valueLove.text = "1347"
                cell.valueView.text = "19789"
                
                return cell
            default:
                break
            }
            
            let cell = UITableViewCell() // cell nil
            return cell
            
        case 1: // table popular
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle14Cell", for: indexPath) as! ViewActivityStyle14Cell
                
                cell.imgCell.image = #imageLiteral(resourceName: "As9.1")
                cell.imgProfile.image = #imageLiteral(resourceName: "profile1")
                cell.name.text = "Gabrielle Madelaine"
                cell.time.text = "An hour ago"
                cell.titile.text = "Shanghai City Landscape"
                cell.des.text = "Weasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and altruistic amiable far much foward"
                cell.hastax.text = "#shanghai #wow"
                cell.valueLove.text = "1347"
                cell.valueView.text = "19789"
                
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle14Cell", for: indexPath) as! ViewActivityStyle14Cell
                
                cell.imgCell.image = #imageLiteral(resourceName: "As9.2")
                cell.imgProfile.image = #imageLiteral(resourceName: "profile2")
                cell.name.text = "Tony Ramirez"
                cell.time.text = "yesterday"
                cell.titile.text = "Japanese Cuisine"
                cell.des.text = "Weasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and altruistic amiable far much foward"
                cell.hastax.text = "#shanghai #wow"
                cell.valueLove.text = "1347"
                cell.valueView.text = "19789"
                
                return cell
            default:
                break
            }
            
            let cell = UITableViewCell() // cell nil
            return cell
            
        case 2: // table favorite
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle14Cell", for: indexPath) as! ViewActivityStyle14Cell
                
                cell.imgCell.image = #imageLiteral(resourceName: "As9.2")
                cell.imgProfile.image = #imageLiteral(resourceName: "profile2")
                cell.name.text = "Tony Ramirez"
                cell.time.text = "An hour ago"
                cell.titile.text = "Shanghai City Landscape"
                cell.des.text = "Weasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and altruistic amiable far much foward"
                cell.hastax.text = "#shanghai #wow"
                cell.valueLove.text = "1347"
                cell.valueView.text = "19789"
                
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle14Cell", for: indexPath) as! ViewActivityStyle14Cell
                
                cell.imgCell.image = #imageLiteral(resourceName: "As9.1")
                cell.imgProfile.image = #imageLiteral(resourceName: "profile1")
                cell.name.text = "Gabrielle Madelaine"
                cell.time.text = "yesterday"
                cell.titile.text = "Japanese Cuisine"
                cell.des.text = "Weasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and altruistic amiable far much foward"
                cell.hastax.text = "#shanghai #wow"
                cell.valueLove.text = "1347"
                cell.valueView.text = "19789"
                
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
        // function hidden for Write
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
    
    // ViewActivityStyle3MenuDelegate
    func feed() {
        tapMenu = 0
        tableNew.isHidden = false
        tableFavo.isHidden = true
        tablePopuler.isHidden = true
    }
    func popular() {
        tableNew.isHidden = true
        tableFavo.isHidden = true
        tablePopuler.isHidden = false
    }
    
    func media() {
        tableNew.isHidden = true
        tableFavo.isHidden = false
        tablePopuler.isHidden = true
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
