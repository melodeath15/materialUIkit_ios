//
//  ActivityStyle11Controller.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ActivityStyle11Controller: UIViewController, UITableViewDataSource, UITableViewDelegate, ViewActivityStyle1HeaderDelegate, ViewActivitySyle11ButtonDelegate {
    
    private var tableStyle: UITableView = UITableView() // var tableView
    var header = ViewActivityStyle1Header() // var view xib in folder style1 name ViewActivityStyle1Header
    var floating = ViewActivitySyle11Button() // var view xib in folder stylw 11 name ViewActivitySyle11Button
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // function for create header, create table and regis UINib, create floating button
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
        self.view.backgroundColor = UIColor.init(colorLiteralRed: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        self.view.addSubview(header)
        
        // Create Table
        tableStyle.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80)
        tableStyle.delegate = self;
        tableStyle.dataSource = self;
        tableStyle.backgroundColor = UIColor.white
        tableStyle.separatorColor = UIColor.clear
        tableStyle.allowsSelection = false
        
        // register UINib for ViewActivityStyle11Text
        tableStyle.register(UINib(nibName: "ViewActivityStyle11Text", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle11Text")
        tableStyle.register(UINib(nibName: "ViewActivityStyle11Image", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle11Image")

        self.view .addSubview(tableStyle)
        
        // Create Floating Button
        floating = Bundle.main.loadNibNamed("ViewActivitySyle11Button", owner: nil, options: nil)?.first as! ViewActivitySyle11Button
        floating.frame = CGRect(x: self.view.frame.size.width-70, y: self.view.frame.size.height-70, width: 60, height: 60)
        floating.backgroundColor = UIColor.clear
        floating.delegate = self
        self.view.addSubview(floating)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return 315
        }else{
            return 160
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle11Text", for: indexPath) as! ViewActivityStyle11Text
            
            cell.profileImg.image = #imageLiteral(resourceName: "profile1")
            
            let stringMain = "Christina Posted"
            let stringDefault = "Posted "
            
            let locDefault = stringMain.characters.count-stringDefault.characters.count
            
            let stringAttributed = NSMutableAttributedString.init(string: "Christina Posted")
            let font = UIFont(name: "verdana", size: 12)
            
            stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
            cell.name?.attributedText = stringAttributed

            cell.time.text = "An hour ago"
            cell.title.text = "Today's Post from Greenland!"
            cell.des.text = "Weasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and alturuistic"
            cell.valueLove.text = "1347"
            cell.valueView.text = "19789"
            
            return cell
        case 1 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle11Image", for: indexPath) as! ViewActivityStyle11Image

            cell.profileImg.image = #imageLiteral(resourceName: "profile2")
            cell.imgPostCell.image = #imageLiteral(resourceName: "As9.1")
            
            let stringMain = "Tony Ramirez Posted"
            let stringDefault = "Posted "
            
            let locDefault = stringMain.characters.count-stringDefault.characters.count
            
            let stringAttributed = NSMutableAttributedString.init(string: "Tony Ramirez Posted")
            let font = UIFont(name: "verdana", size: 12)
            
            stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
            cell.name?.attributedText = stringAttributed

            
            cell.time.text = "An hour ago"
            cell.title.text = "Shanghai City Landscape"
            cell.des.text = "Weasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and alturuistic"
            cell.valueLove.text = "1347"
            cell.valueView.text = "19789"
            
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
    
    // ViewActivitySyle11ButtonDelegate
    func pushFloating() {
        FunctionDefault.AlertMessage(title: "Push Floationg", message: "", targetVC: self)
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
