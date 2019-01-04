//
//  Style11Controller.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/24/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class Style11Controller: UIViewController, UITableViewDataSource, UITableViewDelegate, HeaderStyle1Delegate, FieldStyle11Delegate {

    private var tableStyle: UITableView = UITableView()
    var header = HeaderStyle1() // var view xib in folder style1 name HeaderStyle1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // call function for create nav, create table and regis xib/UINib
    }
    
    func createView() {
        // Create Nav
        header = Bundle.main.loadNibNamed("HeaderStyle1", owner: nil, options: nil)?.first as! HeaderStyle1
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.titleHeader.text = "Sign In"
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
        
        // register UINib for LogoStyle1, FieldStyle11
        tableStyle.register(UINib(nibName: "LogoStyle1", bundle: nil), forCellReuseIdentifier: "LogoStyle1")
        tableStyle.register(UINib(nibName: "FieldStyle11", bundle: nil), forCellReuseIdentifier: "FieldStyle11")
        
        self.view.addSubview(tableStyle)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 120;
        }else{
            return 350
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LogoStyle1", for: indexPath) as! LogoStyle1
            cell.backgroundColor = UIColor.clear
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FieldStyle11", for: indexPath) as! FieldStyle11
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
    
    // Delegate FieldStyle11Delegate
    func textChange(text: String, tag: NSInteger) { // function for get textfield
        switch tag {
        case 0:
            // Textfield Username
            break
        case 1:
            // Textfield Password
            break
        default:
            break
        }
        print("Textfield Result \(text)") // show all textfield
    }
    
    func cekBoxStatus(status: M13Checkbox) { // function cek box
        FunctionDefault.AlertMessage(title: status.checkState.rawValue, message: "", targetVC: self)
    }
    
    func signIn() { // function sign in
        FunctionDefault.AlertMessage(title: "Sign In", message: "", targetVC: self)
    }
    
    func signUp() { // function sign up
        FunctionDefault.AlertMessage(title: "Sign Up", message: "", targetVC: self)
    }
    
    func signInFB() { // function sign in facebook
        FunctionDefault.AlertMessage(title: "Sign In Facebook", message: "", targetVC: self)
    }
    
    func forgotPassword() { // function forgor password
        FunctionDefault.AlertMessage(title: "Forgot Password", message: "", targetVC: self)
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
