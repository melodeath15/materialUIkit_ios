//
//  ActivityStyle21Controller.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ActivityStyle21Controller: UIViewController, UITableViewDataSource, UITableViewDelegate, ViewActivityStyle1HeaderDelegate  {
    
    private var tableStyle: UITableView = UITableView() // var tableView
    var Nav = ViewActivityStyle1Header() // var view xib in folder style1 name ViewActivityStyle1Header
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // function for create nav, create header, create table and regis UINib
    }
    
    func createView(){
        
        // Create Nav
        Nav = Bundle.main.loadNibNamed("ViewActivityStyle1Header", owner: nil, options: nil)?.first as! ViewActivityStyle1Header
        Nav.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        Nav.iconBack.setImage(UIImage(named: "menu1"), for: .normal)
        Nav.btnWrite.isHidden = true
        Nav.titleHeader.text = "Chat"
        
        // function show or close menu left
        Nav.iconBack.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        Nav.delegate = self
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        self.view.addSubview(Nav)
        
        // Create Table
        tableStyle.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80)
        tableStyle.delegate = self;
        tableStyle.dataSource = self;
        tableStyle.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        tableStyle.separatorColor = UIColor.clear
        tableStyle.allowsSelection = false
        
        // register UINib for ViewActivityStyle21
        tableStyle.register(UINib(nibName: "ViewActivityStyle21", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle21")
        self.view .addSubview(tableStyle)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle21", for: indexPath) as! ViewActivityStyle21

        switch indexPath.row {
        case 0:
            cell.imgProfile.image = #imageLiteral(resourceName: "profile1")
            cell.titile.text = "Christina"
            cell.des.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam elementum, felis at bibendum semper, felis ipsum imperdiet ligula, ut ultrices erat ipsum at odio."
            cell.time.text = "11.30"
        case 1:
            cell.imgProfile.image = #imageLiteral(resourceName: "profile2")
            cell.titile.text = "Remi Boucher"
            cell.des.text = "Donec accumsan sapien vitae arcu sagittis rhoncus. Aenean sed dolor vestibulum, ultrices sapien vitae, pharetra mi."
            cell.time.text = "11.30"

        case 2:
            cell.imgProfile.image = #imageLiteral(resourceName: "profile3")
            cell.titile.text = "Steve Rogers"
            cell.des.text = "Integer quis augue eget est pretium feugiat. Phasellus posuere vitae dolor imperdiet gravida. Sed et convallis neque, vel mollis neque. Integer ac bibendum nibh."
            cell.time.text = "11.30"

        case 3:
            cell.imgProfile.image = #imageLiteral(resourceName: "profile1")
            cell.titile.text = "Christina"
            cell.des.text = "Nam gravida quis dolor a consectetur. Curabitur vulputate elit vitae augue tincidunt viverra. Nunc eu ex scelerisque, elementum ex ut, porttitor turpis."
            cell.time.text = "11.30"

        case 4:
            cell.imgProfile.image = #imageLiteral(resourceName: "profile2")
            cell.titile.text = "Remi Boucher"
            cell.des.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam elementum, felis at bibendum semper, felis ipsum imperdiet ligula, ut ultrices erat ipsum at odio."
            cell.time.text = "11.30"

        case 5:
            cell.imgProfile.image = #imageLiteral(resourceName: "profile3")
            cell.titile.text = "Steve Rogers"
            cell.des.text = "Donec eget aliquam sapien. Nam vel arcu eu libero euismod sagittis eu malesuada lacus. Aliquam accumsan congue purus ac consectetur."
            cell.time.text = "11.30"

        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { action, index in
            FunctionDefault.AlertMessage(title: "Delete", message: "", targetVC: self)
        }
        delete.backgroundColor = .red
//        delete.backgroundColor = UIColor(patternImage: UIImage(named: "silang")!)
        return [delete]
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
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
