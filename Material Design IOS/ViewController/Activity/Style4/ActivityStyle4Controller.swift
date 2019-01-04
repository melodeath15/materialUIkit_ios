//
//  ActivityStyle4Controller.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/5/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ActivityStyle4Controller: UIViewController, UITableViewDelegate, UITableViewDataSource, ViewActivityStyle1HeaderDelegate {
 
    private var tableStyle: UITableView = UITableView() // var tableView
    var header = ViewActivityStyle1Header() // var view xib in folder style1 name ViewActivityStyle1Header

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // function for create header, create table and regis UINib
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
        
        // register UINib for ViewActivityStyle4Image
        tableStyle.register(UINib(nibName: "ViewActivityStyle4Image", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle4Image")
        self.view .addSubview(tableStyle)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle4Image", for: indexPath) as! ViewActivityStyle4Image
            
            cell.imgProfile.image = #imageLiteral(resourceName: "profile1")
            cell.name.text = "Gabriella Madelaine"
            cell.time.text = "An hour ago"
            cell.postedPhoto.image = #imageLiteral(resourceName: "As4")
            cell.valuelove.text = "1347"
            cell.valueView.text = "19789"
            
            cell.backgroundColor = UIColor.clear
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle4Image", for: indexPath) as! ViewActivityStyle4Image
            
            cell.imgProfile.image = #imageLiteral(resourceName: "profile2")
            cell.name.text = "Tony Ramirez"
            cell.time.text = "3 hour ago"
            cell.postedPhoto.image = #imageLiteral(resourceName: "As5")
            cell.valuelove.text = "1347"
            cell.valueView.text = "19789"
            
            cell.backgroundColor = UIColor.clear
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
