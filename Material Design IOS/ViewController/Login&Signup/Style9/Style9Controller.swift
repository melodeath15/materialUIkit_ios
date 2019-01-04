//
//  Style9Controller.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/24/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class Style9Controller: UIViewController, UITableViewDataSource, UITableViewDelegate, HeaderStyle1Delegate, HeaderStyle9Delegate, FieldStyle9Delegate {
    
    private var tableStyle: UITableView = UITableView()
    var Nav = HeaderStyle1() // var view xib in folder style1 name HeaderStyle1
    var Header = HeaderStyle9() // var view xib in folder style9 name HeaderStyle9

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // call function for create nav, create header, table and regis xib/UINib
        
    }
    
    func createView() {
        // Create Nav
        Nav = Bundle.main.loadNibNamed("HeaderStyle1", owner: nil, options: nil)?.first as! HeaderStyle1
        Nav.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        Nav.titleHeader.text = ""
        Nav.iconBack.setImage(UIImage(named: "menu1"), for: .normal)
        
        // function show or close menu left
        Nav.iconBack.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        Nav.delegate = self
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        self.view.addSubview(Nav)
        
        // create Header
        Header = Bundle.main.loadNibNamed("HeaderStyle9", owner: nil, options: nil)?.first as! HeaderStyle9
        Header.frame = CGRect(x: 0, y: 90, width: self.view.frame.size.width, height: 150)
        Header.delegate = self
        self.view.addSubview(Header)
        
        // Create Table
        tableStyle.frame = CGRect(x: 0, y: 210, width: self.view.frame.size.width, height: self.view.frame.size.height-210)
        tableStyle.delegate = self;
        tableStyle.dataSource = self;
        tableStyle.backgroundColor = UIColor.clear
        tableStyle.separatorColor = UIColor.clear
        tableStyle.allowsSelection = false
        tableStyle.isScrollEnabled = false
        
        // register UINib for FieldStyle9
        tableStyle.register(UINib(nibName: "FieldStyle9", bundle: nil), forCellReuseIdentifier: "FieldStyle9")
        
        self.view.addSubview(tableStyle)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FieldStyle9", for: indexPath) as! FieldStyle9
        cell.backgroundColor = UIColor.clear
        cell.delegate = self
        return cell
    }
    
    // Delegate HeaderStyle1Delegate
    func back1() { // function for back layout
        // function hidden for left menu
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
    
    // Delegate FieldStyle8Delegate
    func textChange(text: String, tag: NSInteger) { // function for get textfield
        switch tag {
        case 0:
            // Textfield Username
            break
        case 1:
            // Textfield Email
            break
        case 2:
            // Textfield Password
            break
        case 3:
            // Textfield Confirm Password
            break
        default:
            break
        }
        print("Textfield Result \(text)") // show all textfield
    }
    
    func CreateAccount() { // function create account
        FunctionDefault.AlertMessage(title: "Create Account", message: "", targetVC: self)
    }
    
    func LoginFb() { // function login facebook
        FunctionDefault.AlertMessage(title: "Login Facebook", message: "", targetVC: self)
    }
    // end
    
    // Delegate HeaderStyle9Delegate
    func SignIn() { // function sign in
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
