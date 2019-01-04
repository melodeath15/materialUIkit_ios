//
//  ActivityStyle28Controller.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ActivityStyle28Controller: UIViewController, UITableViewDataSource, UITableViewDelegate, ViewActivityStyle1HeaderDelegate, TextFieldActivityStyle9Delegate, TextfieldActivityStyle26Delegate {
    
    private var tableStyle: UITableView = UITableView()
    var header = ViewActivityStyle1Header() // var view xib in folder style1 name ViewActivityStyle1Header
    var Footer = TextfieldActivityStyle26() // var view xib in folder style26 name TextfieldActivityStyle26
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // function for create header, create table and regis UINib
    }
    
    func createView(){
        
        // Create Table
        tableStyle.frame = CGRect(x: 0, y: -20, width: self.view.frame.size.width, height: self.view.frame.size.height+20-50)
        tableStyle.delegate = self;
        tableStyle.dataSource = self;
        tableStyle.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        tableStyle.separatorColor = UIColor.clear
        tableStyle.allowsSelection = false
        
        // register UINib for ViewActivityStyle28Header
        tableStyle.register(UINib(nibName: "ViewActivityStyle28Header", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle28Header")
        tableStyle.register(UINib(nibName: "ChatActivitySyle26Left", bundle: nil), forCellReuseIdentifier: "ChatActivitySyle26Left")
        tableStyle.register(UINib(nibName: "ChatActivityStyle26Right", bundle: nil), forCellReuseIdentifier: "ChatActivityStyle26Right")
        self.view .addSubview(tableStyle)
        
        // Create Header
        header = Bundle.main.loadNibNamed("ViewActivityStyle1Header", owner: nil, options: nil)?.first as! ViewActivityStyle1Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.btnWrite.isHidden = true
        header.btnSearch.isHidden = true
        header.titleHeader.isHidden = true
        header.backgroundColor = UIColor.clear
        header.delegate = self
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        self.view.addSubview(header)
        
        
        Footer = Bundle.main.loadNibNamed("TextfieldActivityStyle26", owner: nil, options: nil)?.first as! TextfieldActivityStyle26
        Footer.frame = CGRect(x: 0, y: self.view.frame.size.height-50, width: self.view.frame.size.width, height: 50)
        Footer.btnSend.backgroundColor = UIColor.clear
        Footer.btnSend.layer.cornerRadius = Footer.btnSend.frame.size.width/2
        Footer.btnSend.clipsToBounds = true
        Footer.bdtnAttc.backgroundColor = UIColor.clear
        Footer.backgroundColor = UIColor.white
        Footer.delegate = self
        self.view.addSubview(Footer)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrolloffset = scrollView.contentOffset.y
        
        if scrolloffset < 80{
            UIView.animate(withDuration: 1, animations:{
                self.header.backgroundColor = UIColor.clear
            }, completion: nil)
        }else if scrolloffset > 80{
            UIView.animate(withDuration: 1, animations:{
                self.header.backgroundColor = UIColor.init(red: 248/255.0, green: 86/255.0, blue: 33/255.0, alpha: 1.0)
            }, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 230
        }else{
            return 71
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle28Header", for: indexPath) as! ViewActivityStyle28Header
            cell.time.text = "2 hour ago"
            cell.imgHeader.image = #imageLiteral(resourceName: "As13")
            cell.imgProfile.image = #imageLiteral(resourceName: "profile3")
            cell.backgroundColor = UIColor.clear
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatActivitySyle26Left", for: indexPath) as! ChatActivitySyle26Left
            cell.valueMessage.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur"
            cell.time.text = "14.22"
            cell.backgroundColor = UIColor.clear
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatActivityStyle26Right", for: indexPath) as! ChatActivityStyle26Right
            cell.valueMessage.text = "Meet me at 10 PM"
            cell.time.text = "14.22"
            cell.backgroundColor = UIColor.clear
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatActivitySyle26Left", for: indexPath) as! ChatActivitySyle26Left
            cell.valueMessage.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur"
            cell.time.text = "14.22"
            cell.backgroundColor = UIColor.clear
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatActivityStyle26Right", for: indexPath) as! ChatActivityStyle26Right
            cell.valueMessage.text = "Wow, that's great!"
            cell.time.text = "09.08"
            cell.backgroundColor = UIColor.clear
            return cell
        default:
            break
        }
        
        let cell = UITableViewCell()
        return cell
    }
    
    // ViewActivityStyle1HeaderDelegate
    func MenuOrBack() { // function for back layout
        navigationController?.popViewController(animated: true)
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
    
    // TextFieldActivityStyle9Delegate
    func textChange(text: String, tag: NSInteger) {
        print("Result Textfield \(text) ")
    }
    
    func Send() {
        FunctionDefault.AlertMessage(title: "Send", message: "", targetVC: self)
    }
    
    func attc() {
        FunctionDefault.AlertMessage(title: "attachment", message: "", targetVC: self)
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
