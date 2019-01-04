//
//  Style1Controller.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/23/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class Style1Controller: UIViewController, UITableViewDelegate, UITableViewDataSource, HeaderStyle1Delegate, FieldStyle1Delegate, ButtonStyle1Delegate {
    
    private var tableStyle: UITableView = UITableView()
    var header = HeaderStyle1() // var view xib in folder style1 name HeaderStyle1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // call function for create header, table and regis xib/UINib
    }
    
    func createView() {
        
        // Create Header
        header = Bundle.main.loadNibNamed("HeaderStyle1", owner: nil, options: nil)?.first as! HeaderStyle1
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.titleHeader.text = "Sign Up"
        header.delegate = self
        self.view.addSubview(header)

        // Create Table
        tableStyle.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80)
        tableStyle.delegate = self;
        tableStyle.dataSource = self;
        tableStyle.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        tableStyle.separatorColor = UIColor.clear
        tableStyle.allowsSelection = false
        tableStyle.isScrollEnabled = false
        
        // register UINib for LogoStyle1, FieldStyle1, ButtonStyle1
        tableStyle.register(UINib(nibName: "LogoStyle1", bundle: nil), forCellReuseIdentifier: "LogoStyle1")
        tableStyle.register(UINib(nibName: "FieldStyle1", bundle: nil), forCellReuseIdentifier: "FieldStyle1")
        tableStyle.register(UINib(nibName: "ButtonStyle1", bundle: nil), forCellReuseIdentifier: "ButtonStyle1")

        self.view .addSubview(tableStyle)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 120
        }else if indexPath.row == 1 {
            return 272
        }else{
            return 94
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LogoStyle1", for: indexPath) as! LogoStyle1
            cell.backgroundColor = UIColor.clear
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FieldStyle1", for: indexPath) as! FieldStyle1
            cell.backgroundColor = UIColor.clear
            cell.delegate = self
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonStyle1", for: indexPath) as! ButtonStyle1
            cell.backgroundColor = UIColor.clear
            cell.delegate = self
            return cell
        default:
            break
        }
        
        let cell = UITableViewCell() // cell nil
        return cell
    }
    
    // Delegate HeaderStyle1Delegate
    func back1() { // function for back layout
        navigationController?.popViewController(animated: true)
    }
    
    func search1() { // function for search
        FunctionDefault.AlertMessage(title: "Search", message: "", targetVC: self)
    }
    
    func MenuOption() { // function for menu option
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
    
    // Delegate FieldStyle1Delegate
    func textChange(text: String, tag: NSInteger) { // function for get textfield
        switch tag {
        case 0:
            // Textfield Fullname
            break
        case 1:
            // Textfield Username
            break
        case 2:
            // Textfield Email
            break
        case 3:
            // Textfield Password
            break
        case 4:
            // Textfield Confirm Password
            break
        default:
            break
        }
        print("Textfield Result \(text)") // show all textfield
    }
    // end
    
    // Delegate ButtonStyle1Delegate
    func CreateAccount() { // function for create account
        FunctionDefault.AlertMessage(title: "Create Account", message: "", targetVC: self)
    }
    
    func Signin() { // function for login
        FunctionDefault.AlertMessage(title: "Sign In", message: "", targetVC: self)
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
