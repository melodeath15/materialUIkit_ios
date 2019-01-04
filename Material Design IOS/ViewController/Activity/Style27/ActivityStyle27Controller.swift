//
//  ActivityStyle27Controller.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ActivityStyle27Controller: UIViewController, UITableViewDataSource, UITableViewDelegate, ViewActivityStyle26Delegate, TextfieldActivityStyle26Delegate {
    
    private var tableStyle: UITableView = UITableView() // var tableView
    var Nav = ViewActivityStyle26() // var view xib in folder style26 name ViewActivityStyle26
    var Footer = TextfieldActivityStyle26() // var view xib in folder style26 name TextfieldActivityStyle26
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // function for create nav, create header, create table and regis UINib
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        
        // Create Nav
        Nav = Bundle.main.loadNibNamed("ViewActivityStyle26", owner: nil, options: nil)?.first as! ViewActivityStyle26
        Nav.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        Nav.titleHeader.text = "Remi Boucher"
        Nav.imgProfile.image = #imageLiteral(resourceName: "profile2")
        Nav.time.text = "2 hours ago"
        Nav.delegate = self
        self.view.addSubview(Nav)
        
        Footer = Bundle.main.loadNibNamed("TextfieldActivityStyle26", owner: nil, options: nil)?.first as! TextfieldActivityStyle26
        Footer.frame = CGRect(x: 0, y: self.view.frame.size.height-50, width: self.view.frame.size.width, height: 50)
        Footer.btnSend.backgroundColor = UIColor.clear
        Footer.btnSend.layer.cornerRadius = Footer.btnSend.frame.size.width/2
        Footer.btnSend.clipsToBounds = true
        Footer.bdtnAttc.backgroundColor = UIColor.clear
        Footer.backgroundColor = UIColor.white
        Footer.delegate = self
        self.view.addSubview(Footer)
        
        // Create Table
        tableStyle.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80-50)
        tableStyle.delegate = self;
        tableStyle.dataSource = self;
        tableStyle.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        tableStyle.separatorColor = UIColor.clear
        tableStyle.allowsSelection = false
        
        // regis UINib for header tableviewcell
        tableStyle.register(UINib(nibName: "ViewActivityStyle2HeaderTable", bundle: nil), forHeaderFooterViewReuseIdentifier: "ViewActivityStyle2HeaderTable")
        
        // register UINib for ChatActivitySyle26Left, ChatActivityStyle26Right, ChatAcitivityStyle26Image
        tableStyle.register(UINib(nibName: "ChatActivitySyle26Left", bundle: nil), forCellReuseIdentifier: "ChatActivitySyle26Left")
        tableStyle.register(UINib(nibName: "ChatActivityStyle26Right", bundle: nil), forCellReuseIdentifier: "ChatActivityStyle26Right")
        tableStyle.register(UINib(nibName: "ChatAcitivityStyle27Image", bundle: nil), forCellReuseIdentifier: "ChatAcitivityStyle27Image")
        self.view .addSubview(tableStyle)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headercell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ViewActivityStyle2HeaderTable") as! ViewActivityStyle2HeaderTable
        
        if section == 0 {
            headercell.title.textAlignment = NSTextAlignment.center
            headercell.title.text = "Yesterday, 25 July 2016"
        }
        
        return headercell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 120
        }else if indexPath.row == 2 {
            return 230
        }else{
            return 71
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatActivitySyle26Left", for: indexPath) as! ChatActivitySyle26Left
            cell.valueMessage.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit"
            cell.time.text = "14.22"
            cell.backgroundColor = UIColor.clear
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatActivityStyle26Right", for: indexPath) as! ChatActivityStyle26Right
            cell.valueMessage.text = "Meet me at 10 PM"
            cell.time.text = "14.22"
            cell.backgroundColor = UIColor.clear
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatAcitivityStyle27Image", for: indexPath) as! ChatAcitivityStyle27Image
            cell.imgChat.image = #imageLiteral(resourceName: "As12")
            cell.title.text = "Remember this photo?"
            cell.time.text = "14.22"
            cell.backgroundColor = UIColor.clear
            return cell
        case 3:
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
    
    // ViewActivityStyle26Delegate
    func MenuOrBack() { // function for back layout
        navigationController?.popViewController(animated: true)
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
    
    // TextfieldActivityStyle26Delegate
    func textChange(text: String, tag: NSInteger) {
        print("text change \(text)")
    }
    
    func Send() {
        FunctionDefault.AlertMessage(title: "Send", message: "", targetVC: self)
    }
    
    func attc() {
        FunctionDefault.AlertMessage(title: "Attachment", message: "", targetVC: self)
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
